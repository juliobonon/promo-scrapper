import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.yellow[200]),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      color: Colors.grey[900],
                      icon: Icon(Icons.settings),
                      onPressed: () {},
                    ),
                  ),
                  CircleAvatar(
                    minRadius: 20,
                    child: Image(
                      width: 200,
                      image: AssetImage(
                        'imgs/avatar.png',
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Welcome back,',
                    style: TextStyle(fontSize: 30, color: Colors.grey[900]),
                  ),
                  Text(
                    'User',
                    style: TextStyle(fontSize: 20, color: Colors.grey[900]),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Favorite Products',
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
