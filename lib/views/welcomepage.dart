import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:srashti/views/signinpage.dart';
import 'package:srashti/views/signuppage.dart';
import 'package:srashti/widgets/coustom_scaffold.dart';
import 'package:srashti/widgets/custom_button.dart';

class Welcomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CoustomScaffold(
      child: Column(
        children: [
          Flexible(
            flex: 8,
              child: Container(child: Center(child:
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Welcome to App!\n',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 45.0
                      )
                    )
                  ]
                ),
              )))
          ),
          Flexible(
              flex:1,
              child:
          Align(
            alignment: Alignment.bottomRight,
            child: Row(
              children: [
                Expanded(child: Loginpage(
btname: 'Signin',bgcolor: Colors.transparent,textStyle:TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.white,
                ),callback: (){
  // Navigator.push(context, MaterialPageRoute(builder: (context) => Signinpage(),));//old_method
  Get.to(()=>Signinpage(),transition:Transition.circularReveal,duration: Duration(seconds: 5));
                },
                )),
                Expanded(child: Loginpage(btname: 'Signup',bgcolor: Colors.white,textStyle:TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.blue,
                ),callback: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => Signuppage(),));//old_method
                  Get.to(()=>Signuppage(),transition: Transition.circularReveal,duration: Duration(seconds: 5));
                },)),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
