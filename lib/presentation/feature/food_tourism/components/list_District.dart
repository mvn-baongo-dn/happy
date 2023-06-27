import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../data/models/common/responses/district.dart';
import '../../../components/custom_overlapped_item.dart';

class ListDistrict extends StatelessWidget {
  const ListDistrict({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: min(screenWidth / 3 * (16 / 6), screenHeight * .9),
      child: CustomOverlappedItem(
        currentIndex: 2,
        district: districts,
        length: districts.length,
        onClicked: (index) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "You clicked at $index",
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}

///==========================================================================///
///=> Behavior of the [FoodTourismPage]
///==========================================================================///
