// ignore_for_file: unused_field, use_build_context_synchronously

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:skru/models/history.model.dart';
import 'package:skru/pages/predictedpage.dart';
import 'package:skru/pages/resultpage.dart';
import 'package:skru/providers/history_provider.dart';
import 'package:skru/utils/displayClass.dart';
import 'package:skru/utils/snackbar.dart';
import 'package:skru/widgets/CustomButton.dart';
import 'package:skru/widgets/PredictResult.dart';
import 'package:tflite/tflite.dart';
import 'package:uuid/uuid.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  bool _loading = true;
  late File _image;
  int indexButton = 0;
  List? _output;
  late String _id;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    Tflite.close();
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 0,
      imageStd: 255,
    );

    setState(() {
      _output = output!;
      _loading = false;
      _id = const Uuid().v4();
    });
    if (_loading == false) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(
              image: _image,
            ),
          ));
    }
  }

  loadModel() async {
    await Tflite.loadModel(
      model: 'assets/model.tflite',
      labels: 'assets/label.txt',
    );
  }

  pickImage() async {
    var image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) return null;

    setState(() {
      _image = File(image.path);
      _loading = false;
    });
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(
            image: _image,
          ),
        ));
    classifyImage(_image);
  }

  pickGalleryImage() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;

    setState(() {
      _image = File(image.path);
      _loading = false;
    });
    classifyImage(_image);
  }

  void handleSaveHistory() async {
    setState(() {
      indexButton = 1;
    });
    var provider = Provider.of<HistoryProvider>(context, listen: false);

    if (await provider.checkIdHistory(_id) == true) {
      alertSnackBar(
          context,
          'ระบบบันทึกข้อมูลนี้แล้ว',
          Colors.red,
          1,
          const FaIcon(
            FontAwesomeIcons.x,
            size: 16,
            color: Colors.white,
          ));
    } else {
      History data = History(
          id: _id,
          image: 'assets/images/skeleton.png',
          title: _output?[0]['label'],
          accuracy: _output?[0]['confidence'],
          createdAt: DateTime.now().toIso8601String());
      // provider

      provider.addHistory(data);

      alertSnackBar(
          context,
          'บันทึกข้อมูลสำเร็จ',
          Colors.green,
          1,
          const FaIcon(
            FontAwesomeIcons.check,
            size: 16,
            color: Colors.white,
          ));
    }
  }

  void handleMoreDetail() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                PredictedScreen(index: _output?[0]['index'])));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 35,
              ),
              const Text(
                'scan',
                style: TextStyle(
                    fontSize: 14,
                    // fontWeight: FontWeight.bold,
                    color: Colors.black26),
              ),
              const Text(
                'ConcreatScan Pro',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Divider(
                color: Colors.black12,
                height: 1,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    height: screenHeight * 0.55,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.asset(
                        'assets/images/main_scan.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ))
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Container(
                    width: screenWidth,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 1),
                          blurRadius: 5,
                          color: Colors.black.withOpacity(0.3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'ConcreatScan Pro',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'สามารถเลือกถ่ายรูป หรือ เลือกจากแกลอรี',
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black45,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          SizedBox(
                            height: 50,
                            child: Row(
                              children: [
                                Expanded(
                                    child: GestureDetector(
                                  onTap: pickImage,
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            offset: const Offset(0, 1),
                                            blurRadius: 5,
                                            color:
                                                Colors.black.withOpacity(0.3),
                                          ),
                                        ],
                                        color: Colors.indigoAccent,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.image,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Text(
                                          'กล้อง',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                                const SizedBox(
                                  width: 14,
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: pickGalleryImage,
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              offset: const Offset(0, 1),
                                              blurRadius: 5,
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                            ),
                                          ],
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          FaIcon(
                                            FontAwesomeIcons.image,
                                            color: Colors.indigoAccent,
                                          ),
                                          SizedBox(
                                            width: 12,
                                          ),
                                          Text(
                                            'แกลอรี',
                                            style: TextStyle(
                                                color: Colors.indigoAccent,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
