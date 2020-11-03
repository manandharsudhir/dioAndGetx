import 'dart:convert';

import 'package:get/get.dart';
import 'package:salesmgmt/app/utilis/dio_utilis.dart';
import 'package:salesmgmt/domain/sales/model/sales.dart';

class SalesServices extends GetxController {
  List<Sales> _sales = [];

  List<Sales> get sales => _sales;
  Future<List<Sales>> findAll() async {
    final response = await authorizationDio.get('/sales');
    List<dynamic> sales = response.data as List;
    _sales = sales.map((sale) => Sales.fromJson(sale)).toList();
    update();
    return _sales;
  }

  Future<Sales> save(Sales sale) async {
    final response =
        await authorizationDio.post('/sales', data: json.encode(sale));
    return Sales.fromJson(response.data);
  }

  Future<Sales> updateSales(Sales sale) async {
    final response = await authorizationDio.put('/sales/${sale.goodsId}',
        data: json.encode(sale));
    return Sales.fromJson(response.data);
  }

  Future<void> remove(String goodsId) async {
    await authorizationDio.delete("/sales/$goodsId");
  }
}
