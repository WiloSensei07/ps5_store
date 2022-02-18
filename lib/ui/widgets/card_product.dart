import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_galery/ui/models/product.dart';
import 'package:app_galery/ui/styles/colors.dart';

class CardProduct extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;
  CardProduct(this.product, {required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(20),
        color: ThemeColor.light,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(
                product.isFavorite
                    ? FontAwesomeIcons.solidHeart
                    : FontAwesomeIcons.heart,
                color: product.isFavorite ? ThemeColor.blue : Colors.grey[400],
              ),
              Expanded(
                child: Center(
                  child: Image.asset(product.image),
                ),
              ),
              SizedBox(height: 5),
              Text(
                product.category,
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(height: 5),
              Text(
                product.title,
                style: TextStyle(
                  color: ThemeColor.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
