import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  factory RegisterState() = _RegisterState;

  const RegisterState._(
      // {
      // required bool enableButton, //TODO: (remove) Example state
      // }
      );

  factory RegisterState.initial() => RegisterState(
      // enableButton: false, // TODO: (remove) init example state
      );
}
