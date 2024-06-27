import 'package:flutter/material.dart';

class Loginpage extends StatelessWidget {
  final String btname;
  final Color? bgcolor;
  final VoidCallback? callback;
  final TextStyle? textStyle;
  Loginpage({
    required this.btname,
    this.bgcolor,
    this.callback,
    this.textStyle,
});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()
    {
      callback!();
      },
      child: Container(
        decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
          ),
        ),
        child: Center(
          child: Text(
            btname,
            style: textStyle
          ),
        ),
      ),
    );
  }
}
