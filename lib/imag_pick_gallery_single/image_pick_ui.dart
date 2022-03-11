import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickk extends StatefulWidget {
  @override
  _ImagePickkState createState() => _ImagePickkState();
}

class _ImagePickkState extends State<ImagePickk> {
  File _image;
  final picker = ImagePicker();
  Future getGalleryImage() async {
    var imaGe = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (imaGe != null) {
        _image = File(imaGe.path);
        print("=======================imagepathe${imaGe.path}");

        imageCache.clear();
      } else {
        print('no image selected');
      }
    });
  }

  Future getCamaroImage() async {
    var imaGe = await picker.getImage(source: ImageSource.camera);
    print("=======================imagepathe${imaGe.path}");

    setState(() {
      if (imaGe != null) {
        _image = File(imaGe.path);
        print("=======================imagepathe${_image}");
        print("=======================imagepathe${imaGe.path}");

        imageCache.clear();
      } else {
        print('no image selected');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.dialog(Center(
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.white,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MaterialButton(
                            child: Text('gallery'),
                            color: Colors.deepOrange,
                            onPressed: () {
                              Get.back();
                              getGalleryImage();
                            },
                          ),
                          MaterialButton(
                            child: Text('camaro'),
                            color: Colors.deepOrange,
                            onPressed: () {
                              Get.back();

                              getCamaroImage();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                )); // ho
              },
              child: Container(
                height: 200,
                width: 200,
                //color: Colors.deepPurple,
                decoration: BoxDecoration(
                  //color: Colors.deepOrange,
                  // shape: BoxShape.circle,
                  border: Border.all(color: Colors.deepOrange),
                ),
                child: _image == null
                    ? Center(
                        child: Text(
                          'hi null ',
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    : Image.file(
                        _image,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
