import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:happy/presentation/routes/app_router.dart';

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
        districts: foodDistrict,
        length: foodDistrict.length,
        onClicked: (index) {
          AutoRouter.of(context)
              .push(FoodTourismDetailRoute(text: foodDistrict[index].name));
        },
      ),
    );
  }
}

///==========================================================================///
///=> Behavior of the [FoodTourismPage]
///==========================================================================///
