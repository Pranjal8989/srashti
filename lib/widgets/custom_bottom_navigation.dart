import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget{
  final ValueChanged<int> onTap;

  CustomBottomNavigation({required this.onTap});
  @override
  Widget build(BuildContext context) {
return CurvedNavigationBar(
  animationDuration: Duration(milliseconds: 300),
  backgroundColor: Colors.blue,
  items: const [
    Icon(
      Icons.home,
      size: 30,
    ),
    Icon(
      Icons.add,
      size: 30,
    ),
    Icon(
      Icons.calendar_month,
      size: 30,
    ),
    Icon(
      Icons.logout,
      size: 30,
    ),
  ],
  onTap: onTap,
);
  }

}