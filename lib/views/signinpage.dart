import 'package:flutter/material.dart';
import 'package:srashti/widgets/coustom_scaffold.dart';

class Signinpage extends StatefulWidget
{
  @override
  State<Signinpage> createState() => _SigninpageState();
}

class _SigninpageState extends State<Signinpage> {
  @override
  Widget build(BuildContext context) {
    return CoustomScaffold(
      title: Text(
        'Back',style: TextStyle(
        fontSize: 20.0,
        color: Colors.white
      ),
      ),
child: Column(
  children: [
    Expanded(
      flex: 1,
        child: SizedBox(height: 10,)),
    Expanded(
        flex:5,child: Container(
      decoration:  BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0)
        )
      ),
    ))
  ],
)
    );
  }
}