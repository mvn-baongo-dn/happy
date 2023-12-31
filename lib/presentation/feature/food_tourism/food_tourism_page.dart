import 'package:auto_route/annotations.dart';

import 'package:flutter/material.dart';

import 'package:happy/presentation/resources/resources.dart';

import './bloc/food_tourism_module.dart';
import './bloc/food_tourism_presenter.dart';
import './bloc/food_tourism_state.dart';
import '../../core/base_page/base_page.dart';
import 'components/item_recommend.dart';
import 'components/list_District.dart';

/// Create at:   27/06/2023
/// Page:        [FoodTourismPage]
/// Module:      [FoodTourismModule]
/// Presenter:   [FoodTourismPresenter]
/// State:       [FoodTourismState]
/// Description:
/// TODO: This is [FoodTourismPage]
///
@RoutePage()
class FoodTourismPage extends BasePage {
  const FoodTourismPage({Key? key}) : super(key: key);

  @override
  State<FoodTourismPage> createState() => _FoodTourismPageState();
}

class _FoodTourismPageState
    extends BasePageState<FoodTourismPage, FoodTourismPresenter> {
  @override
  Widget buildBody(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                AppText.value.whereDoYouWantToGo,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ListDistrict(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    AppText.value.interestingSpaces,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Spacer(),
                  Text(AppText.value.seeAll)
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //TO DO
            ..._buildWidgetRecommend()
          ],
        ),
      ),
    );
  }

  List<Widget> _buildWidgetRecommend() => List.generate(
        10,
        (index) => ItemRecommend(),
      );

  @override
  void handlerFutureError(Object? error) {
    //TODO: (remove) Example of an overridden method
  }

  @override
  bool get resizeToAvoidBottomInset => true;
}
