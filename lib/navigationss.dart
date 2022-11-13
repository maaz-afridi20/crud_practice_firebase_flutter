import 'package:flutter/material.dart';

class Navigationss {
  static navigator(BuildContext context, Widget next) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return next;
        },
      ),
    );
  }
}
