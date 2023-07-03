import 'package:freezed_annotation/freezed_annotation.dart';

part 'exploration_tourism_detail_state.freezed.dart';

@freezed
class ExplorationTourismDetailState with _$ExplorationTourismDetailState {
  factory ExplorationTourismDetailState() = _ExplorationTourismDetailState;

  const ExplorationTourismDetailState._(
      // {
      // required bool enableButton, //TODO: (remove) Example state
      // }
      );

  factory ExplorationTourismDetailState.initial() =>
      ExplorationTourismDetailState(
          // enableButton: false, // TODO: (remove) init example state
          );
}
