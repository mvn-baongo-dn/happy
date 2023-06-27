import 'package:flutter/material.dart';

import '../../../resources/resources.dart';

class TabBarHome extends StatelessWidget {
  const TabBarHome({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    int? _cachedFromIdx;
    int? _cachedToIdx;
    return TabBar(
      padding: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 10),
      tabs: [AppText.value.food, AppText.value.exploration]
          .asMap()
          .entries
          .map(
            (entry) => _buildTab(_cachedFromIdx, _cachedToIdx, entry),
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
    );
  }

  LayoutBuilder _buildTab(
      int? _cachedFromIdx, int? _cachedToIdx, MapEntry<int, String> entry) {
    return LayoutBuilder(
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
              _cachedFromIdx = tabController.previousIndex;
              _cachedToIdx = tabController.index;
              progress = (tabController.animation!.value - _fromIndex).abs() /
                  (_toIndex - _fromIndex).abs();
            } else {
              if (_cachedFromIdx == tabController.previousIndex &&
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
                progress = (tabController.animation!.value - _fromIndex).abs();
              }
            }

            return Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              height: 52,
              decoration: BoxDecoration(
                color: entry.key == _fromIndex
                    ? Color.lerp(Color(0xFFC6D5DA), Color(0xFF2E3132), progress)
                    : entry.key == _toIndex
                        ? Color.lerp(
                            Color(0xFF2E3132), Color(0xFFC6D5DA), progress)
                        : Color.lerp(
                            Color(0xFF2E3132), Color(0xFF2E3132), progress),
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
    );
  }
}
