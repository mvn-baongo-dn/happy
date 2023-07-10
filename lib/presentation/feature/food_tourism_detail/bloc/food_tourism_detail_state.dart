import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_tourism_detail_state.freezed.dart';

@freezed
class FoodTourismDetailState with _$FoodTourismDetailState {
  factory FoodTourismDetailState() = _FoodTourismDetailState;

  const FoodTourismDetailState._(
      // {
      // required bool enableButton, //TODO: (remove) Example state
      // }
      );

  factory FoodTourismDetailState.initial() => FoodTourismDetailState(
      // enableButton: false, // TODO: (remove) init example state
      );
}
