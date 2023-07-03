import 'dart:math';
import 'package:flutter/material.dart';
import '../../../../data/models/common/responses/district.dart';
import '../../../components/custom_overlapped_item.dart';

class ListDistrict extends StatelessWidget {
  const ListDistrict({
    required this.explorationDistrict,
    required this.screenWidth,
    required this.screenHeight,
    required this.onClick,
    super.key,
  });

  final double screenWidth;
  final double screenHeight;
  final Function(int) onClick;
  final List<District> explorationDistrict;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: min(screenWidth / 3 * (16 / 6), screenHeight * .9),
      child: CustomOverlappedItem(
        currentIndex: 2,
        districts: explorationDistrict,
        length: explorationDistrict.length,
        onClicked: (index) => onClick(index),
      ),
    );
  }
}
