import 'package:flutter/material.dart';

class ItemLanguageChoose extends StatelessWidget {
  const ItemLanguageChoose({
    required this.text,
    required this.onTap,
    super.key,
  });

  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 80),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 0.2,
          color: Colors.black,
        ),
      ),
      child: ListTile(
        title: Text(
          text,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          'Ngôn Ngữ',
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 11,
          ),
        ),
        trailing: IconButton(
          onPressed: onTap,
          icon: Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
