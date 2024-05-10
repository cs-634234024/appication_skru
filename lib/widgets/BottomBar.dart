import "package:flutter/material.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:skru/constants/color.dart";

class BottomBar extends StatelessWidget {
  final Function onItemTapped;
  final int selectItem;
  const BottomBar(
      {super.key, required this.onItemTapped, required this.selectItem});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BottomNavigationBar(
        backgroundColor: kbuttonWidgetColor,
        selectedIconTheme: IconThemeData(color: Colors.white),
        unselectedIconTheme: IconThemeData(color: Colors.black38),
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const FaIcon(FontAwesomeIcons.home),
            label: 'หน้าหลัก',
            backgroundColor: Colors.amber.shade200,
          ),
          BottomNavigationBarItem(
            icon: const FaIcon(FontAwesomeIcons.expand),
            label: 'แสกน',
            backgroundColor: Colors.amber.shade200,
          ),
          BottomNavigationBarItem(
            icon: const FaIcon(FontAwesomeIcons.clockRotateLeft),
            label: 'ประวัติ',
            backgroundColor: Colors.amber.shade200,
          ),
          BottomNavigationBarItem(
            icon: const FaIcon(FontAwesomeIcons.user),
            label: 'ผู้ใช้งาน',
            backgroundColor: Colors.amber.shade200,
          ),
        ],
        currentIndex: selectItem,
        selectedItemColor: kbaseIcon,
        // onTap: (value) => onItemTapped(value),
        onTap: (value) => {onItemTapped(value)},
      ),
    );
  }
}
