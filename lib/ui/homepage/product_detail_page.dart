import 'package:flutter/material.dart';
import 'package:app_galery/ui/models/product.dart';
import 'package:app_galery/ui/styles/colors.dart';
import 'package:app_galery/ui/widgets/button_neumorphic.dart';
import 'package:app_galery/ui/widgets/card_feature.dart';
import 'package:app_galery/ui/widgets/header.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;
  BuildContext? context;
  ProductDetailPage(this.product);

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      backgroundColor: ThemeColor.dark,
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return Header(
      bgColor: ThemeColor.dark,
      logo: Image(
        image: AssetImage("assets/logo-light.png"),
        width: 120,
      ),
      leadingBtn: ButtonNeumorphic(
        onTap: () => Navigator.pop(context!),
        bgColor: ThemeColor.dark,
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        topShadowColor: Colors.grey.withOpacity(0.1),
        bottomShadowColor: Colors.black.withOpacity(0.5),
      ),
      actionBtn: ButtonNeumorphic(
        onTap: () {},
        bgColor: ThemeColor.dark,
        icon: Icon(
          Icons.settings,
          color: Colors.white,
        ),
        topShadowColor: Colors.grey.withOpacity(0.1),
        bottomShadowColor: Colors.black.withOpacity(0.5),
      ),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Column(
        children: [
          _buildAppBar(),
          _buildDetailProduct(),
        ],
      ),
    );
  }

  Widget _buildDetailProduct() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: ThemeColor.light,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.only(top: 30),
          child: Column(
            children: <Widget>[
              Image.asset(product.image, height: 220),
              SizedBox(height: 10),
              Image.asset("assets/ring.png", height: 60),
              _buildFeatures(),
              _buildBuyButton()
            ],
          ),
        )),
      ),
    );
  }

  Widget _buildFeatures() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 25),
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CardFeature(
            title: "Built-In Microphone",
            iconData: Icons.mic,
          ),
          CardFeature(
            title: "Headset Jack",
            iconData: Icons.headset_mic,
          ),
          CardFeature(
            title: "Motion Sensor",
            iconData: Icons.router,
          ),
        ],
      ),
    );
  }

  Widget _buildBuyButton() {
    return GestureDetector(
      onTap: () => null,
      child: Container(
        height: 55,
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: ThemeColor.blue,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: 80,
              height: 55,
              decoration: BoxDecoration(
                color: ThemeColor.darkBlue,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Text(
                  product.price,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
                child: Center(
              child: Text(
                "Buy Now",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
