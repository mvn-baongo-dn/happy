import 'package:freezed_annotation/freezed_annotation.dart';

part 'language_selection_state.freezed.dart';

@freezed
class LanguageSelectionState with _$LanguageSelectionState {
  factory LanguageSelectionState() = _LanguageSelectionState;

  const LanguageSelectionState._(
      // {
      // required bool enableButton, //TODO: (remove) Example state
      // }
      );

  factory LanguageSelectionState.initial() => LanguageSelectionState(
      // enableButton: false, // TODO: (remove) init example state
      );
}
