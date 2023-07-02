import 'package:freezed_annotation/freezed_annotation.dart';

part 'exploration_tourism_state.freezed.dart';

@freezed
class ExplorationTourismState with _$ExplorationTourismState {
  factory ExplorationTourismState() = _ExplorationTourismState;

  const ExplorationTourismState._(
      // {
      // required bool enableButton, //TODO: (remove) Example state
      // }
      );

  factory ExplorationTourismState.initial() => ExplorationTourismState(
      // enableButton: false, // TODO: (remove) init example state
      );
}
