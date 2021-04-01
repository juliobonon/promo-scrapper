import 'package:flutter/material.dart';

class PromoButton extends StatelessWidget {
  PromoButton({@required this.text, this.function});

  final text;
  final function;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.purple,
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 18.0),
        ),
        onPressed: function,
      ),
    );
  }
}
