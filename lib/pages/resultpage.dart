import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ResultPage extends StatefulWidget {
  final File image;
  const ResultPage({super.key, required this.image});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  List<String> menus = ['ลักษณะ', 'สาเหตุ', 'ผลกระทบ', 'ทางแก้ไข'];
  List<dynamic> icons = [
    FontAwesomeIcons.book,
    FontAwesomeIcons.gear,
    FontAwesomeIcons.virus,
    FontAwesomeIcons.shield
  ];
  @override
  Widget build(BuildContext context) {
    File image = widget.image;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          SizedBox(
              width: screenWidth,
              height: screenHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: SizedBox(
                            height: screenHeight * 0.35,
                            child: ClipRRect(
                              child: Image.file(
                                image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ))
                        ],
                      ),
                      Positioned(
                          top: 10,
                          left: 10,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4)),
                              child: const Center(
                                child: FaIcon(
                                  FontAwesomeIcons.arrowLeft,
                                  size: 18,
                                ),
                              ),
                            ),
                          )),
                      Positioned(
                          top: 10,
                          right: 10,
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4)),
                            child: const Center(
                              child: FaIcon(
                                FontAwesomeIcons.heart,
                                size: 18,
                              ),
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '89%',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'รอยร้าวจากวัสดุเสื่อมสภาพ',
                              style: TextStyle(fontSize: 14),
                            )
                          ],
                        ),
                        Text('วันที่ 20/06/2567')
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.black12,
                    height: 1,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text(
                      'รายละเอียดเพิ่มเติม',
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SizedBox(
                      height: 100,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: menus.length,
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 25,
                        ),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: const Offset(0, 1),
                                        blurRadius: 5,
                                        color: Colors.black.withOpacity(0.3),
                                      ),
                                    ]),
                                child: Center(
                                  child: FaIcon(icons[index]),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(menus[index])
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        width: screenWidth,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 1),
                                blurRadius: 5,
                                color: Colors.black.withOpacity(0.3),
                              ),
                            ]),
                        child: Center(child: Text('data')),
                      ),
                    ),
                  )
                ],
              )),
        ],
      )),
    );
  }
}
