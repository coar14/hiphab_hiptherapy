import 'package:flutter/material.dart';
import 'package:therapy/screens/learns.dart';
import 'package:therapy/screens/profile.dart';
import 'package:therapy/screens/therapy.dart';

import '../screens/home.dart';
import '../themes/app_image.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<Widget> screenList = [
    const Home(),
    const Learns(),
    const Therapy(),
    Profile(),
  ];

  void onItemTapped(int index) {
    setState(() {
      AppImages.currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: screenList.elementAt(
            AppImages.currentIndex.clamp(0, screenList.length - 1),
          ),
        ),
        bottomNavigationBar: bottomNavigationBars(),
      ),
    );
  }

  Widget bottomNavigationBars() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.black,
      selectedIconTheme: const IconThemeData(
        size: 40,
        color: Colors.black,
      ),
      unselectedIconTheme: const IconThemeData(
        size: 40,
      ),
      type: BottomNavigationBarType.fixed,
      currentIndex: AppImages.currentIndex.clamp(0, screenList.length - 1),
      selectedItemColor: Colors.black,
      onTap: onItemTapped,
      items: <BottomNavigationBarItem>[
        _buildBottomNavigationBarItem(AppImages.home, 0),
        _buildBottomNavigationBarItem(AppImages.learn, 1),
        _buildBottomNavigationBarItem(AppImages.therapy, 2),
        _buildBottomNavigationBarItem(AppImages.profile, 3),
      ],
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      String imageAsset, int index) {
    bool isSelected = AppImages.currentIndex == index;
    return BottomNavigationBarItem(
      icon: Stack(
        alignment: Alignment.center,
        children: [
          if (isSelected)
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.withOpacity(0.5),
              ),
            ),
          ImageIcon(
            AssetImage(imageAsset),
            size: 40,
          ),
        ],
      ),
      label: '',
    );
  }
}
