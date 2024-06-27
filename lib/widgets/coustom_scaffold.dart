import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoustomScaffold extends StatelessWidget {
  const CoustomScaffold({super.key,this.child, this.title});
  final Widget? child;
  final Widget? title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        title: title,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/bg1.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(child: child!)
        ],
      ),
    );
  }
}
