import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:skru/models/history.model.dart';
import 'package:skru/models/news.model.dart';
import 'package:skru/pages/historypage.dart';
import 'package:skru/pages/profilepage.dart';
import 'package:skru/pages/scanpage.dart';
import 'package:skru/providers/history_provider.dart';
import 'package:skru/widgets/BottomBar.dart';
import 'pages/homepage.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  List<NewsModal> news = [];
  List<String> titleAppbar = ['หน้าแรก', "แสกน", 'ประวัติ', 'ผู้ใช้งาน'];
  List<History> histories = [];
  int _selectindex = 1;

  void _getNews() {
    news = NewsModal.getNews();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectindex = index;
    });
  }

  String onCheckMenubar(int index) {
    return titleAppbar[index];
  }

  @override
  void initState() {
    super.initState();
    _getNews();
    Provider.of<HistoryProvider>(context, listen: false).initHistory();
  }

// build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: Consumer(
        builder:
            (BuildContext context, HistoryProvider provider, Widget? child) {
          return onChangeBodyContent(_selectindex, provider.histories);
        },
      ),
      bottomNavigationBar:
          BottomBar(onItemTapped: _onItemTapped, selectItem: _selectindex),
    );
  }

  // Appbar
  AppBar _buildAppbar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // _buildIcon(
          //   "assets/svg/arrow-left.svg",
          // ),
          Text(
            onCheckMenubar(_selectindex),
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
          ),
          // _buildIcon(
          //   "assets/svg/hamburger.svg",
          // ),
        ],
      ),
      elevation: 0,
    );
  }

// icon appbar
  Container _buildIcon(String path) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.amber.shade50),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Center(
          child: SvgPicture.asset(path),
        ),
      ),
    );
  }
}

onChangeBodyContent(int index, List<History> history) {
  if (index == 0) {
    return const HomePage();
  } else if (index == 1) {
    return const ScanPage();
  } else if (index == 2) {
    return HistoryScreen(history: history);
  } else if (index == 3) {
    return const ProfilePage();
  }
}
