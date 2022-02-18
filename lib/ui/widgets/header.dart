import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final Widget leadingBtn;
  final Widget actionBtn;
  final Image logo;
  final Color bgColor;

  Header(
      {required this.leadingBtn,
      required this.actionBtn,
      required this.logo,
      required this.bgColor})
      : assert(bgColor != null),
        assert(logo != null),
        assert(actionBtn != null),
        assert(leadingBtn != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor,
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[leadingBtn, logo, actionBtn],
      ),
    );
  }
}
