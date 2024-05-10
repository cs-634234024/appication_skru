import "package:flutter/material.dart";
import 'package:skru/models/news.model.dart';
import 'package:skru/pages/predictedpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<NewsModal> news = [];

  void _getNews() {
    news = NewsModal.getNews();
  }

  @override
  void initState() {
    super.initState();
    _getNews();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: _buildTitle('สิ่งที่น่าสนใจ', 'เพิ่มเติม'),
          ),
          SizedBox(
            height: 165,
            child: ListView.separated(
                itemCount: news.length,
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(12)),
              child: const Center(
                child: Text('ข่าวสารที่เเนะนำ'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildTitle('ข่าวสารแนะนำ', 'เพิ่มเติม'),
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  news[index].image,
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    news[index].image,
                    opacity: const AlwaysStoppedAnimation(0.5),
                  ),
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
                      news[index].name,
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

Row _buildTitle(String title, String subTitle) {
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
      Text(
        subTitle,
        style: const TextStyle(
          fontSize: 16,
          color: Color(0xFF5BBCFF),
        ),
      ),
    ],
  );
}
