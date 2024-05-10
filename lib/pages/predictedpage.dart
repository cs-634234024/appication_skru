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
  List<String> menus = ['ลักษณะ', 'สาเหตุ', 'ผลกระทบ', 'ทางแก้ไข'];
  List<IconData> icons = [
    FontAwesomeIcons.book,
    FontAwesomeIcons.heartCrack,
    FontAwesomeIcons.circleExclamation,
    FontAwesomeIcons.heartPulse,
  ];
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
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 24.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                    backgroundColor: Colors.white,
                                    maxRadius: 24.0,
                                    backgroundImage: AssetImage(
                                        detail[widget.index].logoImage)),
                                const SizedBox(
                                  width: 8,
                                ),
                                SizedBox(
                                  width: 140,
                                  child: Text(
                                    detail[widget.index].title,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 2,
                            width: 200,
                            decoration:
                                const BoxDecoration(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: 180,
                            child: Text(
                              detail[widget.index].titleEng,
                              style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ],
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
                  const SizedBox(
                    height: 16,
                  ),
                  const Text('ข่าวสารที่แนะนำ'),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 150,
                    // color: Colors.amber,
                    child: ListView.separated(
                      itemCount: 1,
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 15,
                      ),
                      itemBuilder: (context, index) {
                        return _buildNewsCard();
                      },
                    ),
                  ),
                  // const Text(
                  //   'เมนู',
                  //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  // ),
                  // const SizedBox(
                  //   height: 5,
                  // ),
                  // SizedBox(
                  //   height: 50,
                  //   child: ListView.separated(
                  //       scrollDirection: Axis.horizontal,
                  //       itemBuilder: (context, index) {
                  //         return menusAction(index);
                  //       },
                  //       separatorBuilder: (context, index) {
                  //         return const SizedBox(
                  //           width: 8,
                  //         );
                  //       },
                  //       itemCount: 4),
                  // ),
                  const SizedBox(
                    height: 8,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/main.png',
                            scale: 4.2,
                          ),
                          Expanded(
                              child: Container(
                            width: double.infinity,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [menusAction(0), menusAction(1)],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [menusAction(2), menusAction(3)],
                                )
                              ],
                            ),
                          ))
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.amber[300],
                            borderRadius: BorderRadius.circular(4)),
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    FaIcon(
                                      icons[tabMenuIndex],
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      menus[tabMenuIndex],
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(detail[widget.index].detail[tabMenuIndex]),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Positioned(
                  //     top: 0,
                  //     left: 0,
                  //     child: Image.asset(
                  //       'assets/images/main.png',
                  //       scale: 1,
                  //     ))
                ],
              ),
            )
          ],
        ));
  }

  GestureDetector menusAction(int index) {
    return GestureDetector(
      onTap: () => handleIndexMenu(index),
      child: Container(
        width: 115,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color:
                    tabMenuIndex == index ? Colors.indigoAccent : Colors.white,
                width: 3)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              icons[index],
              size: 16,
              color:
                  tabMenuIndex == index ? Colors.indigoAccent : Colors.black26,
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
  }
}

Container _buildNewsCard() {
  return Container(
    height: 130,
    decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9), borderRadius: BorderRadius.circular(8)),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 130,
            width: 120,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(4)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/skeleton.png',
                opacity: const AlwaysStoppedAnimation(0.5),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 130,
            width: 200,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
            child: const Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ชื่อข่าวสาร',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '35 นาทีก่อน',
                      style: TextStyle(fontSize: 12, color: Color(0xFF475467)),
                    )
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Lorem ipsum dolor sit amet consectetur. Dui urna facilisis posuere volutpat aliquam facilisis posuere ....',
                  style: TextStyle(fontSize: 12, color: Color(0xFF475467)),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
