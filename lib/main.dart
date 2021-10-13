import 'package:flutter/material.dart';
import 'package:homefort_app/screens/gallery_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HomeFort Gallery',
      home: GalleryPage(),
    );
  }
}