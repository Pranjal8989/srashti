import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:srashti/controller/mycontroller.dart';
import 'package:srashti/views/dashboard/custombottomsheet.dart';

class Dashboardpage extends StatefulWidget {
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
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          Icon(
            Icons.add,
            size: 30,
          ),
          Icon(
            Icons.lock,
            size: 30,
          ),
          Icon(
            Icons.alarm,
            size: 30,
          ),
          Icon(
            Icons.settings,
            size: 30,
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.blue,
          ),
          Container(
            margin: EdgeInsets.only(top: 60, left: 100),
            // color: Colors.red,
            child: Text(
              'welcome ! ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ),
          CustomBottomsheet(),
        ],
      ),
    );
  }
}
