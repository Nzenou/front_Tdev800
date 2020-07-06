import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class UploadScreen extends StatefulWidget {
  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  static final String uploadEndPoint =
      'http://localhost/flutter_test/upload_image.php';
  File file;
  String status = '';
  String base64Image;
  File tmpFile;
  String errMessage = 'Error Uploading Image';
  final picker = ImagePicker();

  chooseImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
//      file = ImagePicker.pickImage(source: ImageSource.gallery);
      file = File(pickedFile.path);
    });
    setStatus('');
  }

  setStatus(String message) {
    setState(() {
      status = message;
    });
  }

  upload(String fileName) {
    http.post(uploadEndPoint, body: {
      "image": base64Image,
      "name": fileName,
    }).then((result) {
      setStatus(result.statusCode == 200 ? result.body : errMessage);
    }).catchError((error) {
      setStatus(error);
    });
  }


  Widget showImage() {
    return Center(
      child: file == null
          ? Text('Aucune image n\'a été sélectionnée.')
          : Image.file(file),
    );
  }

  startUpload() {
    setStatus('Uploading Image...');
    if (null == tmpFile) {
      setStatus(errMessage);
      return;
    }
    String fileName = tmpFile.path.split('/').last;
    upload(fileName);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30.0),
      child: ListView(
//          crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          OutlineButton(
            onPressed: chooseImage,
            child: Text('Choisir une Image'),
          ),
          SizedBox(
            height: 20.0,
          ),
          showImage(),
          SizedBox(
            height: 20.0,
          ),
          OutlineButton(
            onPressed: startUpload,
            child: Text('Uploader'),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            status,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.w500,
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
