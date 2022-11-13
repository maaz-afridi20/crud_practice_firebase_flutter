import 'package:flutter/material.dart';

class EditData extends StatelessWidget {
  EditData({
    Key? key,
    required this.detail,
    required this.id,
    required this.title,
  }) : super(key: key);

  String title;
  String detail;
  String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editing Data'),
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: title.toString(),
            ),
          ),
        ],
      ),
    );
  }
}
