import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salesmgmt/domain/sales/model/sales.dart';
import 'package:salesmgmt/domain/sales/services/sales_services.dart';
import 'package:salesmgmt/domain/sales/ui/screens/sales_form_view.dart';
import 'package:salesmgmt/domain/sales/ui/widgets/sales_list.dart';

class SalesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SalesServices _salesServices = Get.put(SalesServices());
    return Scaffold(
      appBar: AppBar(
        title: Text('SalesManagement'),
      ),
      body: Container(
          child: FutureBuilder(
              future: _salesServices.findAll(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return Container(
                      child: Center(child: CircularProgressIndicator()));
                } else {
                  return Container(
                      child: _salesServices.sales.length == 0
                          ? Center(child: Text("Create new Sales"))
                          : SalesList(
                              sales: _salesServices.sales, snapshot: snapshot));
                }
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(SalesFormView(
            sale: Sales(),
            title: 'Add Sales',
            actionText: 'Add',
          ));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.lightBlueAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
