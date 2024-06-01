import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// widgets หน้าเเสดงผลลัพการทำนาย
class PredictResult extends StatelessWidget {
  final String title;
  final Color color;
  final int index;
  final double value;
  final VoidCallback onClick;

  const PredictResult({
    super.key,
    required this.title,
    required this.color,
    required this.index,
    required this.value,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        GestureDetector(
          onTap: () => {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Column(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: 300,
                          child: Text(title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: 'Taitham3')),
                        ),
                        Text(
                          '${value.toStringAsFixed(2)} % ',
                          style: const TextStyle(
                              fontSize: 21,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'taitham3'),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    GestureDetector(
                      onTap: onClick,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white54,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Padding(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 5, bottom: 5),
                          child: Text('ดูรายละเอียด',
                              style: TextStyle(color: Colors.black)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
