import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  factory ProfileState() = _ProfileState;

  const ProfileState._(
      // {
      // required bool enableButton, //TODO: (remove) Example state
      // }
      );

  factory ProfileState.initial() => ProfileState(
      // enableButton: false, // TODO: (remove) init example state
      );
}
