import 'package:cinebox/ui/core/themes/colors.dart';
import 'package:cinebox/ui/core/themes/resource.dart';
import 'package:cinebox/ui/home/widget/home_bottom_navbar_item.dart';
import 'package:flutter/material.dart';

class HomeBottomNavbar extends StatefulWidget {
  const HomeBottomNavbar({super.key});

  @override
  State<HomeBottomNavbar> createState() => _HomeBottomNavbarState();
}

class _HomeBottomNavbarState extends State<HomeBottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            spreadRadius: 1,
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          enableFeedback: false,
          backgroundColor: Colors.white,
          currentIndex: 0,
          selectedItemColor: AppColors.redColor,
          unselectedItemColor: AppColors.lightGrey,
          selectedLabelStyle: TextStyle(
            fontSize: 12,
            color: AppColors.redColor,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 10,
            color: AppColors.lightGrey,
            fontWeight: FontWeight.w400,
          ),
          items: [
            HomeBottomNavbarItem(
              label: 'Filmes',
              activeAsset: R.assetsImagesIconFilmeNavBarPng,
              inactiveAsset: R.assetsImagesIconFilmeNavBarInativoPng,
            ),
            HomeBottomNavbarItem(
              label: 'Favoritos',
              activeAsset: R.assetsImagesIconHeartBnbPng,
              inactiveAsset: R.assetsImagesIconHeartBnbInativoPng,
            ),
            HomeBottomNavbarItem(
              label: 'Perfil',
              activeAsset: R.assetsImagesIconProfileNavBarPng,
              inactiveAsset: R.assetsImagesIconProfileNavBarInativoPng,
            ),
          ],
        ),
      ),
    );
  }
}
