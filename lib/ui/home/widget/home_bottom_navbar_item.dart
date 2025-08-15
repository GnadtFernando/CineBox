import 'package:flutter/material.dart';

class HomeBottomNavbarItem extends BottomNavigationBarItem {
  HomeBottomNavbarItem({
    required String label,
    required String activeAsset,
    required String inactiveAsset,
    double iconWidth = 18.0,
    double iconHeight = 18.0,
    double marginTop = 20,
  }) : super(
         icon: Container(
           margin: EdgeInsets.only(top: marginTop, bottom: 5),
           child: Image.asset(
             inactiveAsset,
             width: iconWidth,
             height: iconHeight,
           ),
         ),
         activeIcon: Container(
           margin: EdgeInsets.only(top: marginTop, bottom: 5),

           child: Image.asset(
             activeAsset,
             width: iconWidth,
             height: iconHeight,
           ),
         ),
         label: label,
       );
}
