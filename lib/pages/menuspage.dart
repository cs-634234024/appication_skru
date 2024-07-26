import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skru/models/news.model.dart';
import 'package:skru/pages/predictedpage.dart';

class MenusPage extends StatefulWidget {
  const MenusPage({super.key});

  @override
  State<MenusPage> createState() => _MenusPageState();
}

class _MenusPageState extends State<MenusPage> {
  List<MenusModel> menus = [];

  void _getMenus() {
    menus = MenusModel.getNews();
  }

  @override
  void initState() {
    super.initState();
    _getMenus();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 115,
              height: 70,
              // color: Colors.amber,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ConcreatScan Pro',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'ผู้ช่วยสำหรับการจำแนกการแตกร้าวของคอนกรีต',
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                  )
                ],
              ),
            ),
          ),
          const Divider(
            color: Colors.black12,
            height: 1,
          ),
          const SizedBox(
            height: 16,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Row(
              children: [
                Text(
                  'เมนูรอยแตกร้าวแต่ละประเภท',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
