import 'package:flutter/material.dart';

class ItemLanguage extends StatelessWidget {
  const ItemLanguage({
    required this.onTap,
    required this.text,
    super.key,
  });
  final Function() onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.symmetric(
            horizontal: BorderSide(width: 0.1, color: Colors.black),
          ),
        ),
        child: ListTile(
          title: Text(
            text,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
