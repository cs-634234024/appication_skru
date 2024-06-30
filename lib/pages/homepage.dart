import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/widgets.dart';
import 'package:skru/models/news.model.dart';
import 'package:skru/pages/menuspage.dart';
import 'package:skru/pages/predictedpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MenusModel> menus = [];
  int indexImage = 0;
  List<String> listImage = [
    'assets/images/news/news1.jpg',
    'assets/images/news/news2.jpg',
    'assets/images/news/news3.jpg'
  ];

  void _getNews() {
    menus = MenusModel.getNews();
  }

  @override
  void initState() {
    super.initState();
    _getNews();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    MediaQueryData querySize = MediaQuery.of(context);

    void handleClickMoreMenu() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MenusPage()));
    }

    return SafeArea(
      child: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: screenWidth,
            child: Column(
              children: [
                _buildTop(),
                const SizedBox(
                  height: 15,
                ),
                _buildCenter(screenWidth),
                const SizedBox(
                  height: 15,
                ),
                _buildBottom(handleClickMoreMenu, querySize)
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _buildCenter(double screenWidth) {
    return SizedBox(
      width: screenWidth,
      height: 200,
      // color: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          children: [
            Expanded(
                flex: 5,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.amber.shade200,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(42)),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 1),
                        blurRadius: 5,
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ],
                  ),
                )),
            Expanded(
                flex: 4,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.amber.shade100,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(42),
                        bottomRight: Radius.circular(12)),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 1),
                        blurRadius: 5,
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

// Build top
  Column _buildTop() {
    return const Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('assets/images/main.png'),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'ConcreatScan Pro',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'ผู้ช่วยสำหรับการจำแนกการแตกร้าวของคอนกรีต',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
            )
          ],
        ),
      ],
    );
  }

// build Bottom
  Column _buildBottom(
      void Function() handleClickMoreMenu, MediaQueryData querySize) {
    return Column(
      children: [
        newTitle('ข่าวสารแนะนำ', 'เพิ่มเติม', handleClickMoreMenu, querySize),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          height: 300,
          child: ListView.separated(
            itemCount: 2,
            separatorBuilder: (context, index) => const SizedBox(
              height: 15,
            ),
            itemBuilder: (context, index) {
              return newCard(index, context, querySize);
            },
          ),
        )
      ],
    );
  }

  GestureDetector newCard(
      int index, BuildContext context, MediaQueryData querySize) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PredictedScreen(index: index)))
      },
      child: SizedBox(
        width: querySize.size.width,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 1),
                      blurRadius: 5,
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.asset(
                              menus[index].image,

                              // fit: BoxFit.contain,
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Text(
                                menus[index].name,
                                style: const TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Text(
                                  menus[index].fullDetail,
                                  style: const TextStyle(fontSize: 12),
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                ))),
      ),
    );
  }

  SizedBox newTitle(
      String title, String subTitle, dynamic onTap, MediaQueryData querySize) {
    return SizedBox(
      width: querySize.size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            tapText(subTitle, onTap)
          ],
        ),
      ),
    );
  }

  Widget tapText(String text, dynamic onClick) {
    return GestureDetector(
      onTap: onClick,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          color: Color(0xFF5BBCFF),
        ),
      ),
    );
  }
}
