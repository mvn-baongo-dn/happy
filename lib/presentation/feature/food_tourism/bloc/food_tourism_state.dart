import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_tourism_state.freezed.dart';

@freezed
class FoodTourismState with _$FoodTourismState {
  factory FoodTourismState() = _FoodTourismState;

  const FoodTourismState._(
      // {
      // required bool enableButton, //TODO: (remove) Example state
      // }
      );

  factory FoodTourismState.initial() => FoodTourismState(
      // enableButton: false, // TODO: (remove) init example state
      );
}
