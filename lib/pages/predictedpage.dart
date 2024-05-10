import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skru/models/predicted.model.dart';

class PredictedScreen extends StatefulWidget {
  final int index;
  const PredictedScreen({super.key, required this.index});

  @override
  State<PredictedScreen> createState() => _PredictedScreenState();
}

class _PredictedScreenState extends State<PredictedScreen> {
  int tabMenuIndex = 0;
  List<String> menus = ['ลักษณะ', 'สาเหตุ', 'ผลกระทบ', 'แนวทางแก้ไข'];
  List<String> images = [
    'assets/images/main.png',
    'assets/images/main.png',
    'assets/images/main.png',
    'assets/images/main.png',
  ];
  List<PredictedModel> detail = [];

  void _getDetail() {
    detail = PredictedModel.getPredicted();
  }

  void handleIndexMenu(int index) {
    setState(() {
      tabMenuIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _getDetail();
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
            Container(
              decoration: BoxDecoration(
                  color: Colors.amber.shade200,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26, spreadRadius: 3, blurRadius: 3)
                  ],
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24))),
              height: 175,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                                backgroundColor: Colors.white,
                                maxRadius: 24.0,
                                backgroundImage:
                                    AssetImage(detail[widget.index].logoImage)),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              detail[widget.index].title,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    images[tabMenuIndex],
                    scale: 3,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'เมนู',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => handleIndexMenu(index),
                            child: Container(
                              width: 130,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      color: tabMenuIndex == index
                                          ? Colors.indigoAccent
                                          : Colors.white,
                                      width: 3),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.home,
                                    size: 16,
                                    color: tabMenuIndex == index
                                        ? Colors.indigoAccent
                                        : Colors.black26,
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    menus[index],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: tabMenuIndex == index
                                          ? Colors.indigoAccent
                                          : Colors.black26,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 8,
                          );
                        },
                        itemCount: 4),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(4)),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child:
                          Text('${detail[widget.index].detail[tabMenuIndex]}'),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
