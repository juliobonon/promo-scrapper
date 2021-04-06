import 'package:flutter/material.dart';
import 'package:promoscrapperUI/pages/pelando.dart';
import 'package:promoscrapperUI/pages/testing.dart';
import 'pages/gatry.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        padding: EdgeInsets.all(20),
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
          SizedBox(height: 50),
          Text(
            "Choose the platform:",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          ButtonTheme(
            height: 60,
            child: RaisedButton(
              color: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('imgs/pelando.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(width: 50),
                  Text(
                    'Pelando',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Pelando()));
              },
            ),
          ),
          SizedBox(height: 10),
          ButtonTheme(
            height: 60,
            child: RaisedButton(
              color: Colors.red[800],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('imgs/gatry.png'),
                          fit: BoxFit.fill,
                        )),
                  ),
                  SizedBox(width: 50),
                  Text(
                    'Gatry',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Gatry()));
              },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProductList()));
              },
              child: Text('Testing...'))
        ],
      ),
    );
  }
}
