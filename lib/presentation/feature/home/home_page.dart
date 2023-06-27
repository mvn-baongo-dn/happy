import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy/presentation/feature/food_tourism/food_tourism_page.dart';
import '../../core/base_page/base_page.dart';
import 'bloc/home_page_presenter.dart';
import 'bloc/home_page_state.dart';

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
    int? _cachedFromIdx;
    int? _cachedToIdx;
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
              actions: [
                Center(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: () {},
                    child: Container(
                      width: 45,
                      height: 45,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border:
                            Border.all(color: Color(0xFFC6D5DA), width: 0.2),
                      ),
                      child: Icon(
                        Icons.notifications,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                )
              ],
              title: Center(
                child: Text(
                  'Travel',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              leading: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(15),
                    onTap: () {},
                    child: Container(
                      width: 45,
                      height: 45,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border:
                            Border.all(color: Color(0xFFC6D5DA), width: 0.2),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(82),
                child: Container(
                  child: TabBar(
                    padding: EdgeInsets.only(
                        left: 30, right: 30, top: 20, bottom: 10),
                    tabs: ['Ẩm thực', 'Đi chơi']
                        .asMap()
                        .entries
                        .map(
                          (entry) => LayoutBuilder(
                            builder: (context, constraints) => Container(
                              width: constraints.maxWidth,
                              child: AnimatedBuilder(
                                animation: tabController.animation!,
                                builder: (ctx, snapshot) {
                                  final forward = tabController.offset > 0;
                                  final backward = tabController.offset < 0;
                                  int? _fromIndex;
                                  int? _toIndex;
                                  double progress;

                                  // This value is true during the [animateTo] animation that's triggered when the user taps a [TabBar] tab.
                                  // It is false when [offset] is changing as a consequence of the user dragging the [TabBarView].
                                  if (tabController.indexIsChanging) {
                                    _fromIndex = tabController.previousIndex;
                                    _toIndex = tabController.index;
                                    _cachedFromIdx =
                                        tabController.previousIndex;
                                    _cachedToIdx = tabController.index;
                                    progress = (tabController.animation!.value -
                                                _fromIndex)
                                            .abs() /
                                        (_toIndex - _fromIndex).abs();
                                  } else {
                                    if (_cachedFromIdx ==
                                            tabController.previousIndex &&
                                        _cachedToIdx == tabController.index) {
                                      // When user tap on a tab bar and the animation is completed, it will execute this block
                                      // This block will not be called when user draging the TabBarView
                                      _fromIndex = _cachedFromIdx;
                                      _toIndex = _cachedToIdx;
                                      progress = 1;
                                      _cachedToIdx = null;
                                      _cachedFromIdx = null;
                                    } else {
                                      _cachedToIdx = null;
                                      _cachedFromIdx = null;
                                      _fromIndex = tabController.index;
                                      _toIndex = forward
                                          ? _fromIndex + 1
                                          : backward
                                              ? _fromIndex - 1
                                              : _fromIndex;
                                      progress =
                                          (tabController.animation!.value -
                                                  _fromIndex)
                                              .abs();
                                    }
                                  }

                                  return Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    height: 52,
                                    decoration: BoxDecoration(
                                      color: entry.key == _fromIndex
                                          ? Color.lerp(Color(0xFFC6D5DA),
                                              Color(0xFF2E3132), progress)
                                          : entry.key == _toIndex
                                              ? Color.lerp(Color(0xFF2E3132),
                                                  Color(0xFFC6D5DA), progress)
                                              : Color.lerp(Color(0xFF2E3132),
                                                  Color(0xFF2E3132), progress),
                                      borderRadius: BorderRadius.circular(200),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      entry.value.toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    controller: tabController,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 0,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    unselectedLabelColor: Color(0xFF6D7579),
                    labelColor: Color(0xFF485767),
                    labelPadding: EdgeInsets.only(left: 12),
                  ),
                ),
              ),
            ),
          ],
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: tabController,
            children: [
              FoodTourismPage(),
              Text('bb')
              // const HomePage(
              //   key: PageStorageKey('home2'),
              // ),
              // const HomePage(
              //   key: PageStorageKey('home3'),
              // ),
              // const HomePage(
              //   key: PageStorageKey('home4'),
              // ),
              // const HomePage(
              //   key: PageStorageKey('home5'),
              // ),
            ],
          ),
        ),
      ),
      listener: (context, state) {},
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
///=> Behavior of the [HomePage]
///==========================================================================///
extension _HomePageBehavior on _HomePageState {}
