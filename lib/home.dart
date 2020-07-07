import 'package:flutter/material.dart';
import 'package:picsmanager/upload_screen.dart';

class HomePage extends StatefulWidget {
  HomePage() : super();

  final String title = "Upload Image Demo";

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Widget mainScreen = UploadScreen();

  //

//  Widget showImage() {
//    return FutureBuilder<File>(
//      future: file,
//      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
//        if (snapshot.connectionState == ConnectionState.done &&
//            null != snapshot.data) {
//          tmpFile = snapshot.data;
//          base64Image = base64Encode(snapshot.data.readAsBytesSync());
//          return Flexible(
//            child: Image.file(
//              snapshot.data,
//              fit: BoxFit.fill,
//            ),
//          );
//        } else if (null != snapshot.error) {
//          return const Text(
//            'Error Picking Image',
//            textAlign: TextAlign.center,
//          );
//        } else {
//          return const Text(
//            'No Image Selected',
//            textAlign: TextAlign.center,
//          );
//        }
//      },
//    );
//  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Menu'),
                decoration: BoxDecoration(
                  color: Colors.deepPurple[300],
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.file_upload,
                  color: Colors.deepPurple[300],
                ),
                title: Text('Uploader nouvelle image'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              Divider(color: Colors.black12, height: 1.0, thickness: 2.0),
              ListTile(
                leading: Icon(
                  Icons.photo_album,
                  color: Colors.deepPurple[300],
                ),
                title: Text('Ma Gallerie'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              Divider(color: Colors.black12, height: 1.0, thickness: 2.0),
              ListTile(
                leading: Icon(
                  Icons.power_settings_new,
                  color: Colors.deepPurple[300],
                ),
                title: Text('Deconnexion'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              Divider(color: Colors.black12, height: 1.0, thickness: 2.0),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("Uploader une image"),
        ),
        body: mainScreen);
  }
}
