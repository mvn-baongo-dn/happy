import 'package:flutter/material.dart';

class SliverAppBarButton extends StatelessWidget {
  const SliverAppBarButton({
    required this.icon,
    super.key,
  });
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {},
        child: Container(
          width: 45,
          height: 45,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Color(0xFFC6D5DA), width: 0.2),
          ),
          child: Center(
            child: Icon(
              icon,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
