import 'package:flutter/material.dart';
import 'package:promoscrapperUI/pages/testing.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150,
        ),
        Container(
          child: Text(
            "PromoScrapper",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 45),
          ),
        ),
        Text(
          "Products on sale aggregator",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(child: ProductList())
      ],
    );
  }
}
