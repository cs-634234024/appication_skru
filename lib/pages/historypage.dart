// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skru/models/history.model.dart';
import 'package:skru/providers/history_provider.dart';
import 'package:skru/utils/displayClass.dart';
import 'package:skru/utils/formatDateTime.dart';

class HistoryScreen extends StatefulWidget {
  final List<History> history;
  const HistoryScreen({super.key, required this.history});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<HistoryProvider>(context, listen: false).initHistory();
  }

  @override
  Widget build(BuildContext context) {
    var data = widget.history;
    return data.isNotEmpty
        ? ListView.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 5.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  height: 130,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.asset(
                            data[index].image,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(
                            right: 8.0, top: 8.0, bottom: 8.0, left: 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('ลำดับ ${index + 1}'),
                            Text(displayClass(data[index].title)),
                            Text(
                                '${(data[index].accuracy * 100).toStringAsFixed(2)} %'),
                            Text(formateDateTime(data[index].createdAt)),
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              );
            },
          )
        : const Center(child: Text('ไม่มีข้อมูลที่บันทึกประวัติไว้'));
  }
}
