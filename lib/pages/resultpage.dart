import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:skru/models/history.model.dart';
import 'package:skru/models/predicted.model.dart';
import 'package:skru/providers/history_provider.dart';
import 'package:skru/utils/displayClass.dart';
import 'package:skru/utils/snackbar.dart';

class ResultPage extends StatefulWidget {
  final File image;
  final List output;
  final String id;
  final int index;
  const ResultPage(
      {super.key,
      required this.image,
      required this.output,
      required this.id,
      required this.index});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  int buttonIndex = 0;

  List<String> menus = ['ลักษณะ', 'สาเหตุ', 'ผลกระทบ', 'ทางแก้ไข'];
  List<dynamic> icons = [
    FontAwesomeIcons.book,
    FontAwesomeIcons.gear,
    FontAwesomeIcons.virus,
    FontAwesomeIcons.shield
  ];

  List<PredictedModel> details = [];

  void _getDetail() {
    details = PredictedModel.getPredicted();
    print(details[widget.index].detail[0]);
  }

  @override
  void initState() {
    super.initState();
    _getDetail();
  }

  @override
  Widget build(BuildContext context) {
    dynamic detail = details[widget.index];
    double value = widget.output[0]['confidence'] * 100;
    String label = displayClass(widget.output[0]['label']);
    File image = widget.image;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    void handleSaveHistory() async {
      var provider = Provider.of<HistoryProvider>(context, listen: false);

      if (await provider.checkIdHistory(widget.id) == true) {
        alertSnackBar(
            context,
            'ระบบบันทึกข้อมูลนี้แล้ว',
            Colors.red,
            1,
            const FaIcon(
              FontAwesomeIcons.x,
              size: 16,
              color: Colors.white,
            ));
      } else {
        History data = History(
            id: widget.id,
            image: 'assets/images/skeleton.png',
            title: widget.output[0]['label'],
            accuracy: widget.output[0]['confidence'],
            createdAt: DateTime.now().toIso8601String());
        // provider

        provider.addHistory(data);

        alertSnackBar(
            context,
            'บันทึกข้อมูลสำเร็จ',
            Colors.green,
            1,
            const FaIcon(
              FontAwesomeIcons.check,
              size: 16,
              color: Colors.white,
            ));
      }
    }

    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          SizedBox(
              width: screenWidth,
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
                          child: GestureDetector(
                            onTap: () => handleSaveHistory(),
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
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${value.toStringAsFixed(2)}',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '${label}',
                              style: TextStyle(fontSize: 14),
                            )
                          ],
                        ),
                        // Text('วันที่ 20/06/2567')
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
                    child: Container(
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
                              GestureDetector(
                                onTap: () => {
                                  setState(() {
                                    buttonIndex = index;
                                  })
                                },
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      color: buttonIndex == index
                                          ? Colors.blueAccent
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: const Offset(0, 1),
                                          blurRadius: 5,
                                          color: Colors.black.withOpacity(0.3),
                                        ),
                                      ]),
                                  child: Center(
                                    child: FaIcon(
                                      icons[index],
                                      color: buttonIndex == index
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
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
                ],
              )),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: screenWidth,
              decoration: BoxDecoration(
                  color: Colors.blueAccent.shade100,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 1),
                      blurRadius: 5,
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  detail.detail[buttonIndex],
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
