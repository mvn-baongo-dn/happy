import 'package:flutter/material.dart';

import '../../../resources/resources.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    required this.text,
    super.key,
    required this.isLastWidget,
  });

  final String text;
  final bool isLastWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Spacer(),
          isLastWidget ? Text(AppText.value.seeAll) : SizedBox()
        ],
      ),
    );
  }
}
