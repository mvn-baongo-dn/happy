import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../components/sliver_app_bar_button.dart';
import './bloc/profile_module.dart';
import './bloc/profile_presenter.dart';
import './bloc/profile_state.dart';
import '../../core/base_page/base_page.dart';

/// Create at:   07/07/2023
/// Page:        [ProfilePage]
/// Module:      [ProfileModule]
/// Presenter:   [ProfilePresenter]
/// State:       [ProfileState]
/// Description:
/// TODO: This is [ProfilePage]
///
@RoutePage()
class ProfilePage extends BasePage {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends BasePageState<ProfilePage, ProfilePresenter>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void onInitState() {
    super.onInitState();
    _tabController = TabController(length: 2, vsync: this);
  }

  // @override
  // void onDispose() {
  //   _tabController.dispose();
  //   super.onDispose();
  // }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) => AppBar(
        title: Text('Profile'),
        centerTitle: true,
        leading: _buildLeadingSliverAppBar(),
        backgroundColor: Color(0xFF1E1F20),
        elevation: 0,
        actions: _buildActionSliverAppBar(),
      );

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: 20,
        ),
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.blue,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Ngô Ngọc Gia Bảo',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        TabBar(
          labelColor: Colors.red,
          unselectedLabelColor: Colors.grey,
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.grid_on_rounded),
            ),
            Tab(
              icon: Icon(
                Icons.favorite,
              ),
            ),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              Card(
                margin: const EdgeInsets.all(16.0),
                child: Center(
                  child: Icon(Icons.abc),
                ),
              ),
              Card(
                margin: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(' Specifications tab'),
                ),
              ),
            ],
          ),
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
  Row _buildLeadingSliverAppBar() {
    return Row(
      children: [
        // SizedBox(
        //   width: 10,
        // ),
        BackButton()
        // SliverAppBarButton(
        //   onTap: () {},
        //   icon: Icons.arrow_back_ios_new,
        // ),
      ],
    );
  }

  List<Widget> _buildActionSliverAppBar() {
    return [
      SliverAppBarButton(
        onTap: () => AutoRouter.of(context).pop,
        icon: Icons.menu,
      ),
      SizedBox(
        width: 10,
      ),
    ];
  }
}

///==========================================================================///
///=> Behavior of the [ProfilePage]
///==========================================================================///
extension _ProfilePageBehavior on _ProfilePageState {
  void _onPressButton() {
    //TODO: (remove) Example of a self-defined method
  }
}
