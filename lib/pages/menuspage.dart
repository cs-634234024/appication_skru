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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade200,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/images/main.png'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 115,
                      height: 70,
                      // color: Colors.amber,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'ConcreatScan Pro',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'ผู้ช่วยสำหรับการจำแนกการแตกร้าวของคอนกรีต',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.normal),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
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
              Container(
                // height: MediaQuery.of(context).size.height - 300,
                height: 1000,
                decoration: BoxDecoration(color: Colors.amber.shade200),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 1),
                            blurRadius: 5,
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ],
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25))),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 30, bottom: 0),
                      child: GridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          children: List<Widget>.generate(
                              menus.length,
                              (index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () => {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PredictedScreen(
                                                        index: index)))
                                      },
                                      child: Container(
                                          width: 100,
                                          height: 200,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  offset: const Offset(0, 1),
                                                  blurRadius: 5,
                                                  color: Colors.black
                                                      .withOpacity(0.3),
                                                ),
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          child: Column(
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 115,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  12),
                                                          topRight:
                                                              Radius.circular(
                                                                  12)),
                                                  child: Image.asset(
                                                    menus[index].image,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 14,
                                              ),
                                              Text(
                                                menus[index].name,
                                                textAlign: TextAlign.center,
                                              )
                                            ],
                                          )),
                                    ),
                                  ))),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: Colors.amber.shade200,
    );
  }
}
