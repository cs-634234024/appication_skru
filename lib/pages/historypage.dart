// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:skru/models/history.model.dart';
import 'package:skru/providers/history_provider.dart';
import 'package:skru/utils/displayClass.dart';
import 'package:skru/utils/formatDateTime.dart';
import 'package:skru/utils/snackbar.dart';

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
    void handleRemove(String id) {
      var provider = Provider.of<HistoryProvider>(context, listen: false);
      provider.removeHistory(id);
      // context , message , color , duration , icon
      alertSnackBar(
          context,
          'ลบข้อมูลสำเร็จ',
          Colors.red,
          1,
          const FaIcon(
            FontAwesomeIcons.trash,
            size: 16,
            color: Colors.white,
          ));
    }

    List<History> history = widget.history;

    return history.isNotEmpty
        ? ListView.builder(
            itemCount: history.length,
            itemBuilder: (BuildContext context, int index) {
              History data = history[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 5.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.amberAccent.shade100,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  height: 130,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Image.asset(
                              data.image,
                              scale: 5,
                              opacity: const AlwaysStoppedAnimation(0.5),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(
                            right: 8.0, top: 8.0, bottom: 8.0, left: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'ลำดับ ${index + 1}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: GestureDetector(
                                    onTap: () => handleRemove(data.id),
                                    child: CircleAvatar(
                                      radius: 14,
                                      backgroundColor: Colors.red.shade300,
                                      child: const FaIcon(
                                        FontAwesomeIcons.trash,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Text(displayClass(data.title)),
                            Text(
                                '${(data.accuracy * 100).toStringAsFixed(2)} %'),
                            Text(formateDateTime(data.createdAt)),
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
