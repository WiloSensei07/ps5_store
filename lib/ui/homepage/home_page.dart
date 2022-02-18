import 'package:app_galery/ui/homepage/homepage_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_galery/ui/models/product.dart';
import 'package:app_galery/ui/homepage/product_detail_page.dart';
import 'package:app_galery/ui/styles/colors.dart';
import 'package:app_galery/ui/widgets/button_neumorphic.dart';
import 'package:app_galery/ui/widgets/card_product.dart';
import 'package:app_galery/ui/widgets/header.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.light,
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildAppBar() {
    return Header(
      bgColor: ThemeColor.light,
      logo: Image(
        image: AssetImage("assets/logo.png"),
        width: 120.0,
      ),
      leadingBtn: ButtonNeumorphic(
        onTap: () {},
        bgColor: ThemeColor.light,
        icon: Icon(
          Icons.sort,
          color: Colors.black,
        ),
        topShadowColor: Colors.white,
        bottomShadowColor: Colors.grey.withOpacity(0.3),
      ),
      actionBtn: ButtonNeumorphic(
        onTap: () {},
        bgColor: ThemeColor.light,
        icon: Icon(
          Icons.settings,
          color: Colors.black,
        ),
        topShadowColor: Colors.white,
        bottomShadowColor: Colors.grey.withOpacity(0.3),
      ),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Column(
        children: [
          _buildAppBar(),
          _buildGridProducts(),
        ],
      ),
    );
  }

  Widget _buildGridProducts() {
    return Expanded(
      child: Center(
        child: GridView.builder(
          itemCount: 4,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: .6),
          padding: EdgeInsets.all(20),
          itemBuilder: (ctx, index) {
            return CardProduct(
              listProduct[index],
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(listProduct[index]),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      decoration: BoxDecoration(
        color: ThemeColor.dark,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ButtonNeumorphic(
            onTap: () {},
            bgColor: ThemeColor.dark,
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            topShadowColor: Colors.grey.withOpacity(0.1),
            bottomShadowColor: Colors.black.withOpacity(0.5),
          ),
          ButtonNeumorphic(
            onTap: () {},
            bgColor: ThemeColor.dark,
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            topShadowColor: Colors.grey.withOpacity(0.1),
            bottomShadowColor: Colors.black.withOpacity(0.5),
          ),
          ButtonNeumorphic(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyHomePage(),
              ),
            ),
            bgColor: ThemeColor.dark,
            icon: Icon(
              FontAwesomeIcons.userCircle,
              color: Colors.white,
              size: 20,
            ),
            topShadowColor: Colors.grey.withOpacity(0.1),
            bottomShadowColor: Colors.black.withOpacity(0.5),
          ),
        ],
      ),
    );
  }
}
