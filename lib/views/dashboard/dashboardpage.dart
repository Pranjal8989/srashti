import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:srashti/controller/mycontroller.dart';
import 'package:srashti/views/addpage/create_table_page.dart';
import 'package:srashti/views/dashboard/custombottomsheet.dart';
import 'package:srashti/views/welcomepage.dart';

import '../../widgets/custom_bottom_navigation.dart';

class Dashboardpage extends StatefulWidget {
  @override
  State<Dashboardpage> createState() => _DashboardpageState();
}

class _DashboardpageState extends State<Dashboardpage> {
  final mycontroller = Get.put(Mycontroller());
  String userName ='';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadUserData();
  }
Future<void> loadUserData () async{
    var userData = await mycontroller.getUserData();
    userName = userData['name'];
}

  void _onNavItemTapped(int index) {
    switch (index) {
      case 0:
      // Handle navigation for each tab index
        break;
      case 1:
        Get.to(() => CreateTablePage(),transition: Transition.rightToLeftWithFade,duration: Duration(seconds:2))?.then((_) {
          loadUserData(); // Update state when returning from CreateTablePage
        });
        break;
      case 2:
        // Get.to(() => );
        break;
      case 3:
        Get.offAll(() => Welcomepage());
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar:CustomBottomNavigation(onTap: _onNavItemTapped),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blue,
        child: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height * 0.1,
              left: MediaQuery.of(context).size.width * 0.2,
              right: MediaQuery.of(context).size.width * 0.2,
              // bottom: 100,/
              child: Card(
                elevation: 5,
                  child: Container(
                    // margin: EdgeInsets.only(top: 60, left: 100),
                    // color: Colors.red,
                    child: Text(
                      'Welcome!,$userName',//we use widget beacuse we use statefull widget
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                  ),

              ),
            ),
            CustomBottomsheet(),
          ],
        ),
      ),
    );
  }
}
