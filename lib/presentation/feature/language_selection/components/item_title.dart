import 'package:flutter/material.dart';

class Item_title extends StatelessWidget {
  const Item_title({
    super.key, required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Color(0xFFA6A6AA),
        ),
      ),
    );
  }
}
