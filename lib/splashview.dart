import 'dart:async';

import 'package:flutter/material.dart';
import 'package:srashti/views/welcomepage.dart';
import 'package:srashti/widgets/coustom_scaffold.dart';

class Splashview extends StatefulWidget{
  @override
  State<Splashview> createState() => _SplashviewState();
}


class _SplashviewState extends State<Splashview> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Welcomepage(),));
    });
  }
  @override
  Widget build(BuildContext context) {
    return CoustomScaffold(
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Trying to connect to server...",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 30,
            ),
            CircularProgressIndicator(
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}