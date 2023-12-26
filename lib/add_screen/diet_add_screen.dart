import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DietAddScreen extends StatefulWidget {
  const DietAddScreen({super.key});

  @override
  State<DietAddScreen> createState() => _DietAddScreenState();
}

class _DietAddScreenState extends State<DietAddScreen> {
  ImagePicker imagePicker = ImagePicker();
  bool isExistImage = false;
  XFile? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const CloseButton(
            color: Colors.blue,
          ),
          title: const Text('추가'),
          actions: [
            TextButton(
              onPressed: () {},
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
            children: [
              titleTextFieldWidget(),
              SizedBox(
                width: 300,
                height: 300,
                child: imagePickerWidget(),
              ),
              Expanded(child: bodyTextFieldWidget()),
            ],
          ),
        ));
  }

  Widget titleTextFieldWidget() {
    return TextField(
      autofocus: true,
      decoration: InputDecoration(
        labelText: 'title',
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.blue, width: 1.0)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 1.0)),
        hintText: '00/00 00시',
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
              width: 250,
              height: 250,
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  'assets/image_add_icon.png',
                ),
              ),
            )
          : Image.file(
              File(_selectedImage!.path),
              width: 250,
            ),
    );
  }

  Future<void> getImage() async {
    _selectedImage = await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {});
  }

  Widget bodyTextFieldWidget() {
    return TextField(
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
