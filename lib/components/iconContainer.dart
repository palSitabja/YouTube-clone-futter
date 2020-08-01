import 'package:flutter/material.dart';

class BottomBarIcons extends StatelessWidget {
  final IconData icon;
  final String iconName;
  final Color iconColor;
  const BottomBarIcons({this.icon, this.iconName, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          size: 25.0,
          color: iconColor,
        ),
        Text(
          iconName,
          style: TextStyle(fontSize: 13.0, color: iconColor),
        )
      ],
    );
  }
}