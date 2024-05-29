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

  @override
  Widget build(BuildContext context) {
    void handleClickMoreMenu() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MenusPage()));
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.amber.shade200,
                    backgroundImage: AssetImage('assets/images/main.png'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
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
              const SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 1),
                        blurRadius: 5,
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ],
                    color: Colors.amber.shade300,
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 200,
                      height: 120,
                      // color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'ConcreatScan Pro',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('พัฒนาโดย'),
                          Text('นางสาว ทดสอบ ทดสอบ'),
                          Text('ติดต่อ'),
                          Text('0xx-xxx-xxxx')
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 235,
                      height: MediaQuery.of(context).size.height - 100,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/cracks/dialog_cracks.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // color: Colors.green,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
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
                    return _buildNewsCard(index, context);
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  GestureDetector _buildNewsCard(int index, BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PredictedScreen(index: index)))
      },
      child: Container(
        height: 130,
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
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 130,
                width: 120,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset(
                    menus[index].image,
                    fit: BoxFit.cover,
                    opacity: const AlwaysStoppedAnimation(1),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 130,
                width: 200,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(4)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 193,
                          child: Text(
                            menus[index].name,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 193,
                      child: Text(
                        menus[index].fullDetail,
                        style:
                            TextStyle(fontSize: 12, color: Color(0xFF475467)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
}
