import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

  void inCreaseIndex() {
    setState(() {
      if (indexImage < listImage.length - 1) {
        indexImage += 1;
      } else {
        indexImage = 0;
      }
    });
  }

  void deCreaseIndex() {
    setState(() {
      if (indexImage <= 0) {
        indexImage = listImage.length - 1;
      } else {
        indexImage -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    void handleClickMoreMenu() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MenusPage()));
    }

    return ListView(children: [
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child:
                _buildTitle('สิ่งที่น่าสนใจ', 'เพิ่มเติม', handleClickMoreMenu),
          ),
          SizedBox(
            height: 165,
            child: ListView.separated(
                itemCount: menus.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 20, right: 20),
                separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                itemBuilder: (context, index) {
                  return _buildMenuCard(index);
                }),
          ),
          const SizedBox(
            height: 10,
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(listImage[indexImage]),
                          fit: BoxFit.cover),
                      color: const Color(0xFFD9D9D9),
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              Positioned(
                  left: 30,
                  bottom: 95,
                  child: GestureDetector(
                    onTap: deCreaseIndex,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(6)),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        child: FaIcon(
                          FontAwesomeIcons.chevronLeft,
                          color: Colors.black38,
                        ),
                      ),
                    ),
                  )),
              Positioned(
                  right: 30,
                  bottom: 95,
                  child: GestureDetector(
                    onTap: inCreaseIndex,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.circular(6)),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        child: FaIcon(
                          FontAwesomeIcons.chevronRight,
                          color: Colors.black38,
                        ),
                      ),
                    ),
                  )),
              Positioned(
                  bottom: 20,
                  child: SizedBox(
                      height: 20,
                      width: 395,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            listImage.length,
                            (index) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: CircleAvatar(
                                  backgroundColor: indexImage == index
                                      ? Colors.black54
                                      : Colors.black26,
                                  radius: 9,
                                )),
                          ))))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildTitle('ข่าวสารแนะนำ', 'เพิ่มเติม', handleClickMoreMenu),
                SizedBox(
                  height: 300,
                  // color: Colors.amber,
                  child: ListView.separated(
                    itemCount: 2,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 15,
                    ),
                    itemBuilder: (context, index) {
                      return _buildNewsCard(index);
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ]);
  }

  Container _buildNewsCard(int index) {
    return Container(
      height: 130,
      decoration: BoxDecoration(
          color: const Color(0xFFD9D9D9),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 130,
              width: 120,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(4)),
              child: Image.asset(
                listImage[index],
                fit: BoxFit.cover,
                opacity: const AlwaysStoppedAnimation(1),
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
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '35 นาทีก่อน',
                        style:
                            TextStyle(fontSize: 12, color: Color(0xFF475467)),
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

  GestureDetector _buildMenuCard(int index) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PredictedScreen(index: index)))
      },
      child: Container(
        width: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: index % 2 == 0 ? Colors.amber[300] : Colors.amber[600]),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                child: Image.asset(
                  menus[index].image,
                  fit: BoxFit.cover,
                  opacity: const AlwaysStoppedAnimation(0.5),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Center(
                child: SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      menus[index].name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Row _buildTitle(String title, String subTitle, dynamic onTap) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      tapText(subTitle, onTap)

      //  Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => PredictedScreen(index: index)))
      // Text(
      //   subTitle,
      //   style: const TextStyle(
      //     fontSize: 16,
      //     color: Color(0xFF5BBCFF),
      //   ),
      // ),
    ],
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
