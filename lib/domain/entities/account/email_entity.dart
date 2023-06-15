import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../utilities/constants/regex_constants.dart';
import '../../../utilities/extensions/extensions.dart';

part 'email_entity.freezed.dart';

@freezed
class EmailEntity with _$EmailEntity {
  const factory EmailEntity(
    String? value,
  ) = _EmailEntity;

  const EmailEntity._();

  factory EmailEntity.create(String value) => EmailEntity(value);

  factory EmailEntity.pure() => const EmailEntity(null);

  bool get valid => _isEmail();

  String? get errorText {
    if (_isEmail() || value == null) {
      return null;
    } else if (value.isNullOrEmpty) {
      return '';
    } else {
      return '';
    }
  }

  bool _isEmail() => RegExp(RegexConstants.email).hasMatch(value ?? '');
}
