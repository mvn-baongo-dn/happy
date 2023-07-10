import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../data/models/common/responses/district.dart';

class ListImageUser extends StatelessWidget {
  const ListImageUser({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate:
          SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (_, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(foodDistrict[index].image),
      ),
      itemCount: foodDistrict.length,
    );
  }
}
