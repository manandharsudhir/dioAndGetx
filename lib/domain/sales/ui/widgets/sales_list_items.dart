import 'package:flutter/material.dart';
import 'package:salesmgmt/domain/sales/model/sales.dart';
import 'package:get/get.dart';
import 'package:salesmgmt/domain/sales/ui/screens/sales_form_view.dart';
import 'package:salesmgmt/domain/sales/ui/screens/sales_items_details.dart';

class SalesListItems extends StatelessWidget {
  final Sales sale;

  final globalKey = GlobalKey<ScaffoldState>();

  SalesListItems({this.sale});

  void navigateToSalesForm() {
    Get.to(SalesFormView(
      sale: sale,
      title: 'Update Sale',
      actionText: 'Update',
    ));
  }

  void navigateToSalesItemDetails() {
    Get.to(SalesItemsDetails(
      sale: sale,
    ));
  }

  void remove(String goodsId) async {}

  @override
  Widget build(BuildContext context) {
    print('list rebuild');
    return Card(
        key: globalKey,
        margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
        child: ListTile(
            onTap: () => navigateToSalesItemDetails(),
            leading: CircleAvatar(
              foregroundColor: Colors.white,
              backgroundColor: Theme.of(context).primaryColor,
              child: Text(sale.goodsId[0]),
            ),
            title: Text(sale.goodsId),
            subtitle: Text(sale.description),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.edit),
                    color: Colors.blueAccent,
                    onPressed: () => navigateToSalesForm()),
                IconButton(
                    icon: Icon(Icons.delete),
                    color: Colors.redAccent,
                    onPressed: () {})
              ],
            )));
  }
}
