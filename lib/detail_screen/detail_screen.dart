import 'dart:convert';

import 'package:flutter/material.dart';

import '../model/diet.dart';

class DetailScreen extends StatefulWidget {
  Diet _model;

  DetailScreen({
    super.key,
    required Diet model,
  }) : _model = model;

  @override
  State<DetailScreen> createState() => _DietAddScreenState();
}

class _DietAddScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.blue,
          ),
          title: const Text('상세'),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
              },
              child: const Text(
                '완료',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: titleTextWidget(widget._model.title)),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                child: imageWidget(widget._model.imageBase64),
                margin: EdgeInsets.all(12.0),
              ),
              bodyTextWidget(widget._model.body),
            ],
          ),
        ));
  }

  Widget titleTextWidget(String title) {
    return Text(
      title,
      style: TextStyle(
        height: 3,
        fontWeight: FontWeight.w500,
        fontSize: 20,
      ),
    );
  }

  Widget imageWidget(String base64Image) {
    // var uInt8Image = base64Decode(base64Image);

    return Image.asset('assets/image_add_icon.png');
    // return Image.memory(
    //   uInt8Image,
    //   height: MediaQuery.of(context).size.height * 0.3,
    // );
  }

  Widget bodyTextWidget(String bodyText) {
    return Text(
      bodyText,
      // textAlign: TextAlign.,
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }
}
