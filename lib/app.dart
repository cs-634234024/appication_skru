import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:skru/models/history.model.dart';
import 'package:skru/models/news.model.dart';
import 'package:skru/pages/historypage.dart';
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
  List<MenusModel> news = [];
  List<String> titleAppbar = ['', "", 'ประวัติ', 'ผู้ใช้งาน'];
  List<History> histories = [];
  int _selectindex = 1;

  void _getNews() {
    news = MenusModel.getNews();
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
      // appBar: _buildAppbar(),
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
      // backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            onCheckMenubar(_selectindex),
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      elevation: 0,
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
  }
}
