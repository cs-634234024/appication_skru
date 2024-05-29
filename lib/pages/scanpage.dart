// ignore_for_file: unused_field, use_build_context_synchronously

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:skru/models/history.model.dart';
import 'package:skru/pages/predictedpage.dart';
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
    return ListView(
      children: [
        Stack(
          children: [
            _buildTop(context),
            Padding(
              padding: const EdgeInsets.only(top: 420.0),
              child: _buildBottom(),
            )
          ],
        )
      ],
    );
  }

  Container _buildTop(BuildContext context) {
    return Container(
      height: 600,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.amber[50]),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _loading == true
                ? Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Image.asset(
                      'assets/images/main.png',
                      scale: 1.25,
                      opacity: const AlwaysStoppedAnimation(0.8),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 75,
                      height: 350,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.file(
                          _image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Container _buildBottom() {
    return Container(
      height: 275,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black26, spreadRadius: 3, blurRadius: 3)
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: _loading == false ? _buildPredicted() : _buildSelectImage(),
    );
  }

  Column _buildPredicted() {
    return Column(
      children: [
        _buildSelectMenu(),
        const SizedBox(
          height: 10,
        ),
        _output != null
            ? PredictResult(
                title: displayClass(_output?[0]['label']),
                color: Colors.amber.shade200,
                index: 2,
                value: _output?[0]['confidence'] * 100,
                onClick: handleMoreDetail,
              )
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25.0),
                    child: Container(
                      child: Text('กำลังโหลด...'),
                    ),
                  ),
                ],
              )
      ],
    );
  }

  Row _buildSelectMenu() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => {
              setState(() {
                indexButton = 0;
              })
            },
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                ),
                border: Border(
                    bottom: BorderSide(
                        color:
                            indexButton == 0 ? Colors.black38 : Colors.black12,
                        width: indexButton == 0 ? 3 : 2)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.circleInfo,
                    size: 20,
                    color: indexButton == 0 ? Colors.black45 : Colors.black26,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    'ผลการสแกน',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: indexButton == 0 ? Colors.black45 : Colors.black26,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Expanded(
            child: GestureDetector(
          onTap: () => handleSaveHistory(),
          child: Container(
            height: 45,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(
                        color:
                            indexButton == 1 ? Colors.black38 : Colors.black12,
                        width: indexButton == 1 ? 3 : 2)),
                borderRadius:
                    const BorderRadius.only(topRight: Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.download,
                    size: 20,
                    color: indexButton == 1 ? Colors.black45 : Colors.black26,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    'บันทึกประวัติ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: indexButton == 1 ? Colors.black45 : Colors.black26,
                    ),
                  )
                ],
              ),
            ),
          ),
        ))
      ],
    );
  }

  Column _buildSelectImage() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 16.0),
          child: Text(
            'ConcreatScan Pro',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black54),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        CustomButton(
          title: 'กล้อง',
          icon: const FaIcon(
            FontAwesomeIcons.camera,
            color: Colors.white,
          ),
          onClick: pickImage,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomButton(
          title: 'แกลอรี่',
          icon: const FaIcon(
            FontAwesomeIcons.image,
            color: Colors.white,
          ),
          onClick: pickGalleryImage,
        ),
      ],
    );
  }
}
