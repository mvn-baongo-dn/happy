import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import './home_page_state.dart';
import '../../../core/base_page/base_bloc/base_presenter.dart';

class HomePagePresenter extends BasePresenter<HomePageState> {
  HomePagePresenter({
    @visibleForTesting HomePageState? state,
  }) : super(state ?? HomePageState.initial());

  void handleShowNavigatorBottom(StackRouter router) {
    emit(
      state.copyWith(
        isShowNavigatorBottom: router.isRouteActive('HomeRoute') ||
            router.isRouteActive('TodosRoute') ||
            router.isRouteActive('ProfileRoute'),
      ),
    );
  }

  void showNavigationBottom() {
    emit(
      state.copyWith(
        isShowNavigatorBottom: true,
      ),
    );
  }

  void setCurrentIndex(int currentIndex) {
    emit(state.copyWith(currentIndex: currentIndex.toDouble()));
  }

  void setIndex(DragUpdateDetails details, int length) {
    var index = state.currentIndex - details.delta.dx * 0.038;
    if (index >= -1 && index <= length - 1) {
      emit(
        state.copyWith(currentIndex: index),
      );
    }
  }

  void ceilCurrentIndex() {
    emit(state.copyWith(currentIndex: state.currentIndex.ceil().toDouble()));
  }

  double getCardPosition(int index, double maxWidth) {
    final double center = maxWidth / 2;
    final double centerWidgetWidth = maxWidth / 3.5;
    final double basePosition = center - centerWidgetWidth / 2 - 35;
    final distance = state.currentIndex - index;

    final double nearWidgetWidth = centerWidgetWidth / 5 * 3;
    final double farWidgetWidth = centerWidgetWidth / 5 * 2;

    if (distance == 0) {
      return basePosition;
    } else if (distance.abs() > 0.0 && distance.abs() <= 1.0) {
      if (distance > 0) {
        return basePosition - nearWidgetWidth * distance.abs();
      } else {
        return basePosition + centerWidgetWidth * distance.abs();
      }
    } else if (distance.abs() >= 1.0 && distance.abs() <= 2.0) {
      if (distance > 0) {
        return (basePosition - nearWidgetWidth) -
            farWidgetWidth * (distance.abs() - 1);
      } else {
        return (basePosition + centerWidgetWidth + nearWidgetWidth) +
            farWidgetWidth * (distance.abs() - 2) -
            (nearWidgetWidth - farWidgetWidth) *
                ((distance - distance.floor()));
      }
    } else {
      if (distance > 0) {
        return (basePosition - nearWidgetWidth) -
            farWidgetWidth * (distance.abs() - 1);
      } else {
        return (basePosition + centerWidgetWidth + nearWidgetWidth) +
            farWidgetWidth * (distance.abs() - 2);
      }
    }
  }

  double getCardWidth(int index, double maxWidth) {
    final double distance = (state.currentIndex - index).abs();
    final double centerWidgetWidth = maxWidth / 2;
    final double nearWidgetWidth = centerWidgetWidth / 5 * 3.5;
    final double farWidgetWidth = centerWidgetWidth / 5 * 2.5;

    if (distance >= 0.0 && distance < 1.0) {
      return centerWidgetWidth -
          (centerWidgetWidth - nearWidgetWidth) * (distance - distance.floor());
    } else if (distance >= 1.0 && distance < 2.0) {
      return nearWidgetWidth -
          (nearWidgetWidth - farWidgetWidth) * (distance - distance.floor());
    } else {
      return farWidgetWidth;
    }
  }

  Matrix4 getTransform(int index) {
    var transform = Matrix4.identity()
      ..setEntry(3, 2, 0.007)
      ..scale(1.25, 1.25, 1.25);
    if (index == state.currentIndex) {
      transform.scale(1.1, 1.05, 1.05);
    }
    print('transform is ...........$transform');
    return transform;
  }

  // void setCenterCard(int index, double centerIndex) {
  //   for (int i = 0; i < state.CardModel.length; i++) {
  //     state.CardModel[i].isCenter = (cards[i].id == centerIndex);
  //   }
  // }
}
