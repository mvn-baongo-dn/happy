import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy/presentation/feature/exploration_tourism/exploration_tourism_page.dart';
import 'package:happy/presentation/feature/food_tourism/food_tourism_page.dart';
import 'package:happy/presentation/resources/resources.dart';
import '../../components/sliver_app_bar_button.dart';
import '../../core/base_page/base_page.dart';
import 'bloc/home_page_presenter.dart';
import 'bloc/home_page_state.dart';
import 'components/tab_bar_home.dart';

/// Create at:   30/05/2023
/// Page:        [HomePage]
/// Module:      [HomePageModule]
/// Presenter:   [HomePagePresenter]
/// State:       [HomePageState]
/// Description:
/// TODO:  create a base dashboard
///
@RoutePage()
class HomePage extends BasePage {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BasePageState<HomePage, HomePagePresenter>
    with TickerProviderStateMixin {
  late TabController tabController;
  ScrollController _scrollController = ScrollController();
  @override
  void onInitState() {
    tabController = TabController(
      length: 2,
      vsync: this,
    );
    presenter.setCurrentIndex(2);
    super.onInitState();
  }

  @override
  Widget buildBody(BuildContext context) {
    return BlocConsumer<HomePagePresenter, HomePageState>(
      bloc: presenter,
      builder: (context, state) => SafeArea(
        child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, headerSliverBuilder) => [
            SliverAppBar(
              elevation: 0,
              backgroundColor: Color(0xFF1E1F20),
              pinned: true,
              snap: true,
              floating: true,
              actions: _buildActionSliverAppBar(),
              title: _buildTitleSliverAppBar(),
              leading: _buildLeadingSliverAppBar(),
              bottom: _buildBottomSliverAppBar(),
            ),
          ],
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: tabController,
            children: [
              ExplorationTourismPage(),
              FoodTourismPage(),
            ],
          ),
        ),
      ),
      listener: (context, state) {},
    );
  }

  PreferredSize _buildBottomSliverAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(82),
      child: Container(
        child: TabBarHome(tabController: tabController),
      ),
    );
  }

  Row _buildLeadingSliverAppBar() {
    return Row(
      children: [
        SizedBox(
          width: 10,
        ),
        SliverAppBarButton(
          icon: Icons.arrow_back_ios_new,
        ),
      ],
    );
  }

  Center _buildTitleSliverAppBar() {
    return Center(
      child: Text(
        AppText.value.travel,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  List<Widget> _buildActionSliverAppBar() {
    return [
      SliverAppBarButton(
        icon: Icons.notifications,
      ),
      SizedBox(
        width: 10,
      ),
    ];
  }

  @override
  void handlerFutureError(Object? error) {
    //TODO: (remove) Example of an overridden method
  }

  @override
  bool get resizeToAvoidBottomInset => true;
}

///==========================================================================///
///=> Behavior of the [HomePage]
///==========================================================================///
extension _HomePageBehavior on _HomePageState {}
