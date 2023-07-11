import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_state.freezed.dart';

@freezed
class MenuState with _$MenuState {
  factory MenuState() = _MenuState;

  const MenuState._(
      // {
      // required bool enableButton, //TODO: (remove) Example state
      // }
      );

  factory MenuState.initial() => MenuState(
      // enableButton: false, // TODO: (remove) init example state
      );
}
