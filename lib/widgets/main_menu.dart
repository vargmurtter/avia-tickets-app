import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../colors.dart';
import '../images.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: baseGrey1Color, width: 1))
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 24,
        backgroundColor: baseBlackColor,
        currentIndex: 0,
        selectedItemColor: specBlueColor,
        unselectedItemColor: baseGrey6Color,
        elevation: 0,
        selectedLabelStyle: TextStyle(
          color: specBlueColor,
          fontSize: 10,
          fontFamily: 'Pro-Display',
          fontWeight: FontWeight.w600
        ),
        unselectedLabelStyle: TextStyle(
          color: baseGrey6Color,
          fontSize: 10,
          fontFamily: 'Pro-Display',
          fontWeight: FontWeight.w600
        ),
        showUnselectedLabels: true,
        onTap: (int index) {},
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ticketsIcon,
            activeIcon: ticketsSelectedIcon,
            label: 'Авиабилеты',
          ),
          BottomNavigationBarItem(
            icon: hotelsIcon,
            label: 'Отели',
          ),
          BottomNavigationBarItem(
            icon: inShortIcon,
            label: 'Короче',
          ),
          BottomNavigationBarItem(
            icon: subsIcon,
            label: 'Подписки',
          ),
          BottomNavigationBarItem(
            icon: profileIcon,
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}
