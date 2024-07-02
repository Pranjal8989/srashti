import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:srashti/controller/mycontroller.dart';

class Dashboardpage extends StatefulWidget{
  @override
  State<Dashboardpage> createState() => _DashboardpageState();
}

class _DashboardpageState extends State<Dashboardpage> {
  final mycontroller = Get.put(Mycontroller());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      mycontroller.showBottomSheet();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // appBar:  AppBar(
      //   backgroundColor: Theme.of(context).primaryColor,
      // ),
      //body: Container(height: 200,width: 200,color: Colors.red,),
    );
  }
}