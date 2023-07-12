import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy/domain/use_cases/auth/clear_auth_local_use_case.dart';
import 'package:happy/presentation/feature/exploration_tourism/exploration_tourism_page.dart';
import 'package:happy/presentation/feature/food_tourism/food_tourism_page.dart';
import 'package:happy/presentation/resources/resources.dart';
import 'package:happy/presentation/routes/app_router.dart';
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
    return BlocBuilder<HomePagePresenter, HomePageState>(
      bloc: presenter,
      builder: (context, state) => SafeArea(
        child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, headerSliverBuilder) => [
            SliverAppBar(
              centerTitle: true,
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
          onTap: () {
            ClearAuthLocalUseCase().run();
          },
          icon: Icons.arrow_back_ios_new,
        ),
      ],
    );
  }

  Text _buildTitleSliverAppBar() {
    return Text(
      AppText.value.travel,
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  List<Widget> _buildActionSliverAppBar() {
    return [
      Builder(
        builder: (context) => SliverAppBarButton(
          icon: Icons.settings,
          onTap: () => Scaffold.of(context).openEndDrawer(),
        ),
      ),
      SizedBox(
        width: 10,
      ),
    ];
  }

  @override
  Widget? buildEndDrawer(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width * 0.5,
        child: GestureDetector(
          onTap: () => AutoRouter.of(context).push(ProfileRoute()),
          child: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  currentAccountPictureSize: const Size.square(72.0),
                  // <-- SEE HERE
                  decoration: BoxDecoration(color: const Color(0xff764abc)),
                  accountName: Text(
                    "Pinkesh Darji",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  accountEmail: Text(
                    "pinkesh.earth@gmail.com",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  currentAccountPicture: CircleAvatar(),
                ),
                ListTile(
                  leading: Icon(
                    Icons.home,
                  ),
                  title: const Text('Page 1'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.train,
                  ),
                  title: const Text('Page 2'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      );

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
