import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:happy/presentation/feature/exploration_tourism_detail/components/list_image_user.dart';

import '../../components/sliver_app_bar_button.dart';
import '../../resources/resources.dart';
import './bloc/food_tourism_detail_module.dart';
import './bloc/food_tourism_detail_presenter.dart';
import './bloc/food_tourism_detail_state.dart';

import '../../core/base_page/base_page.dart';
import 'components/search.dart';

/// Create at:   10/07/2023
/// Page:        [FoodTourismDetailPage]
/// Module:      [FoodTourismDetailModule]
/// Presenter:   [FoodTourismDetailPresenter]
/// State:       [FoodTourismDetailState]
/// Description:
/// TODO: This is [FoodTourismDetailPage]
@RoutePage()
class FoodTourismDetailPage extends BasePage {
  const FoodTourismDetailPage({@PathParam('text') required this.text, Key? key})
      : super(key: key);
  final String text;

  @override
  State<FoodTourismDetailPage> createState() => _FoodTourismDetailPageState();
}

class _FoodTourismDetailPageState
    extends BasePageState<FoodTourismDetailPage, FoodTourismDetailPresenter> {
  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) => AppBar(
        backgroundColor: AppColors.value.background,
        //TODO: (remove) App bar of new page
        title: Text(widget.text),
        centerTitle: true,
        elevation: 0,
        leading: _buildLeadingSliverAppBar(),
      );

  @override
  Widget buildBody(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: [
            Search(),
            SizedBox(
              height: 10,
            ),
            ListImageUser()
          ],
        ),
      );
  Row _buildLeadingSliverAppBar() {
    return Row(
      children: [
        SizedBox(
          width: 10,
        ),
        SliverAppBarButton(
          onTap: () => AutoRouter.of(context).pop(),
          icon: Icons.arrow_back_ios_new,
        ),
      ],
    );
  }

  @override
  void handlerFutureError(Object? error) {
    //TODO: (remove) Example of an overridden method
  }

  @override
  bool get resizeToAvoidBottomInset => true;
}

///==========================================================================///
///=> Behavior of the [FoodTourismDetailPage]
///==========================================================================///
extension _FoodTourismDetailPageBehavior on _FoodTourismDetailPageState {}
