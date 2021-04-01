import 'package:flutter/material.dart';

class PromoInput extends StatelessWidget {
  PromoInput({@required this.name, this.controller, this.validator});

  final name;
  final controller;
  final validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: name,
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
      ),
      controller: controller,
      validator: validator,
    );
  }
}
