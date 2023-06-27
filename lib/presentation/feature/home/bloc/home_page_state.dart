import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_page_state.freezed.dart';

@freezed
class HomePageState with _$HomePageState {
  factory HomePageState({
    required bool isShowNavigatorBottom,
    required double currentIndex,
    required bool isCenter,
  }) = _HomePageState;

  const HomePageState._();

  factory HomePageState.initial() => HomePageState(
        isShowNavigatorBottom: true,
        currentIndex: 2,
        isCenter: false,
      );
}
