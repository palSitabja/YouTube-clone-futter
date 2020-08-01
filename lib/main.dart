import 'package:flutter/material.dart';
import 'package:youtube_clone/screens/homescreen.dart';


void main() {
  runApp(YtClone());
}

class YtClone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    // double height = size.height;
    // double width = size.width;
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}
