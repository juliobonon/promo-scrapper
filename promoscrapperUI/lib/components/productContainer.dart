import 'package:flutter/material.dart';
import 'package:promoscrapperUI/pages/gatry.dart';

class ProductContainer extends StatelessWidget {
  ProductContainer({this.snapshot});

  final snapshot;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[800],
      ),
      padding: EdgeInsets.only(
        left: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                    image: NetworkImage(snapshot.image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductPage(),
                          settings: RouteSettings(
                            arguments: snapshot,
                          ),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: Image.asset(
                      'imgs/gatry.png',
                      width: 25,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LinkLoja(
                            title: snapshot.name,
                            url: snapshot.linkgatry,
                          ),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.favorite_outline_rounded),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LinkLoja(
                            title: snapshot.name,
                            url: snapshot.linkgatry,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
          Text(
            snapshot.name,
            style: TextStyle(fontSize: 18.0),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          SizedBox(height: 5),
          Text(snapshot.price)
        ],
      ),
    );
  }
}
