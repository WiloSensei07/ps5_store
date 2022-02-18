import 'package:flutter/material.dart';
import 'package:app_galery/ui/styles/colors.dart';

class CardFeature extends StatelessWidget {
  final String title;
  final IconData iconData;

  CardFeature({required this.title, required this.iconData})
      : assert(title != null),
        assert(iconData != null);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/card_feature.png"),
        Container(
          width: 100,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(
                iconData,
                color: ThemeColor.blue,
                size: 30,
              ),
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ],
    );
  }
}
