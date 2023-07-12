import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../components/sliver_app_bar_button.dart';
import './bloc/exploration_tourism_detail_module.dart';
import './bloc/exploration_tourism_detail_presenter.dart';
import './bloc/exploration_tourism_detail_state.dart';
import '../../core/base_page/base_page.dart';
import 'components/list_image_user.dart';
import 'components/list_travel_service.dart';
import 'components/title_widget.dart';

/// Create at:   03/07/2023
/// Page:        [ExplorationTourismDetailPage]
/// Module:      [ExplorationTourismDetailModule]
/// Presenter:   [ExplorationTourismDetailPresenter]
/// State:       [ExplorationTourismDetailState]
/// Description:
/// TODO: This is [ExplorationTourismDetailPage]
///
@RoutePage()
class ExplorationTourismDetailPage extends BasePage {
  const ExplorationTourismDetailPage({
    @PathParam('text') required this.text,
    Key? key,
  }) : super(key: key);

  final String text;

  @override
  State<ExplorationTourismDetailPage> createState() =>
      _ExplorationTourismDetailPageState();
}

class _ExplorationTourismDetailPageState extends BasePageState<
    ExplorationTourismDetailPage, ExplorationTourismDetailPresenter> {
  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) => AppBar(
        title: Text(widget.text),
        centerTitle: true,
        leading: _buildLeadingSliverAppBar(),
        backgroundColor: Color(0xFF1E1F20),
        elevation: 0,
      );

  @override
  Widget buildBody(BuildContext context) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            TitleWidget(
              text: 'Các khu du lịch',
            ),
            ListTravelService(),
            TitleWidget(
              text: 'Đóng góp từ người dùng',
            ),
            SizedBox(
              height: 10,
            ),
            ListImageUser()
          ],
        ),
      );

  @override
  void handlerFutureError(Object? error) {
    //TODO: (remove) Example of an overridden method
  }

  @override
  bool get resizeToAvoidBottomInset => true;

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
}

///==========================================================================///
///=> Behavior of the [ExplorationTourismDetailPage]
///==========================================================================///
extension _ExplorationTourismDetailPageBehavior
    on _ExplorationTourismDetailPageState {
  // void _onPressButton() {
  //   //TODO: (remove) Example of a self-defined method
  // }
}
