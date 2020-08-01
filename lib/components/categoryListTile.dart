import 'package:flutter/material.dart';
import 'package:youtube_clone/models/categories.dart';

class CategoryListTile extends StatelessWidget {
  final double width;
  final int index;
  final Color color,textColor;
  const CategoryListTile({
    @required this.width,
    @required this.index,
    this.color,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.02, vertical: width * 0.01),
        child: Container(
          // padding: EdgeInsets.symmetric(
          //     horizontal: width * 0.04, vertical: width * 0.02),
          padding: EdgeInsets.symmetric(horizontal: width * 0.035),
          child: Center(
            child: Text(
              categories[index].name,
              style: TextStyle(color: textColor, fontSize: 18.0),
            ),
          ),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(30.0),
            border: Border.all(color: Colors.grey,width: 0.2)
          ),
        ));
  }
}
