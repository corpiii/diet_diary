import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../model/diet.dart';

class DietAddScreen extends StatefulWidget {
  const DietAddScreen({super.key});

  @override
  State<DietAddScreen> createState() => _DietAddScreenState();
}

class _DietAddScreenState extends State<DietAddScreen> {
  ImagePicker imagePicker = ImagePicker();
  XFile? _selectedImage;

  TextEditingController _titleTextEditingController = TextEditingController();
  TextEditingController _bodyTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: CloseButton(
            color: Colors.blue,
          ),
          title: const Text('추가'),
          actions: [
            TextButton(
              onPressed: () async {
                final title = _titleTextEditingController.text;
                final body = _bodyTextEditingController.text;

                if (_selectedImage != null &&
                    title.isNotEmpty &&
                    body.isNotEmpty) {
                  final imageBase64 =
                      base64Encode(await _selectedImage!.readAsBytes());

                  final result =
                      Diet(title: title, imageBase64: imageBase64, body: body);
                  Navigator.of(context).pop(result);
                }
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
        body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                titleTextFieldWidget(),
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: imagePickerWidget(),
                  margin: EdgeInsets.all(12.0),
                ),
                bodyTextFieldWidget(),
              ],
            ),
          ),
        ));
  }

  Widget titleTextFieldWidget() {
    return TextField(
      controller: _titleTextEditingController,
      autofocus: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.blue, width: 1.0)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 1.0)),
        hintText: '날짜, 식사시간',
      ),
    );
  }

  Widget imagePickerWidget() {
    return GestureDetector(
      onTap: () {
        getImage();
      },
      child: _selectedImage == null
          ? Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.2),
              child: Container(
                child: Image.asset(
                  'assets/image_add_icon.png',
                ),
              ),
            )
          : Image.file(
              File(_selectedImage!.path),
            ),
    );
  }

  Future<void> getImage() async {
    _selectedImage = await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {});
  }

  Widget bodyTextFieldWidget() {
    return TextField(
      controller: _bodyTextEditingController,
      maxLength: 100,
      maxLines: 4,
      minLines: 4,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.blue, width: 1.0)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 1.0)),
      ),
      style: TextStyle(
        fontSize: 20,
      ),
    );
  }
}
