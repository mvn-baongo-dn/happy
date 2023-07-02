import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../resources/resources.dart';
import '../../routes/app_router.dart';
import './bloc/exploration_tourism_module.dart';
import './bloc/exploration_tourism_presenter.dart';
import './bloc/exploration_tourism_state.dart';
import '../../core/base_page/base_page.dart';
import 'components/item_recommend.dart';
import 'components/list_District.dart';

/// Create at:   28/06/2023
/// Page:        [ExplorationTourismPage]
/// Module:      [ExplorationTourismModule]
/// Presenter:   [ExplorationTourismPresenter]
/// State:       [ExplorationTourismState]
/// Description:
/// TODO: This is [ExplorationTourismPage]

class ExplorationTourismPage extends BasePage {
  const ExplorationTourismPage({Key? key}) : super(key: key);

  @override
  State<ExplorationTourismPage> createState() => _ExplorationTourismPageState();
}

class _ExplorationTourismPageState
    extends BasePageState<ExplorationTourismPage, ExplorationTourismPresenter> {
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
              onClick: (index) => AutoRouter.of(context).replace(LoginRoute()),
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

///==========================================================================///
///=> Behavior of the [ExplorationTourismPage]
///==========================================================================///
// extension _ExplorationTourismPageBehavior on _ExplorationTourismPageState {
//   void _onPressButton() {
//     //TODO: (remove) Example of a self-defined method
//   }
// }
