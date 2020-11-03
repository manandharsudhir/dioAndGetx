import 'package:flutter/material.dart';

class FlatBtnWithBoldTxt extends StatelessWidget {
  final Function onPressed;
  final String btnText;
  const FlatBtnWithBoldTxt({
    Key key,
    this.onPressed,
    this.btnText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        child: Text(
          btnText,
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
        ),
        onPressed: onPressed);
  }
}
