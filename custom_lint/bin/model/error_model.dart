

import 'package:custom_lint_builder/custom_lint_builder.dart';

class ErrorModel {
  const ErrorModel({
    required this.code,
    required this.content,
    required this.severity,
    this.location,
    this.correction,
  });

  final String code;
  final String content;
  final String? correction;
  final LintSeverity severity;
  final LintLocation? location;

  String get message => '${severity.name} • $content';

  ErrorModel copyWith({
    String? code,
    String? content,
    String? correction,
    LintSeverity? severity,
    LintLocation? location,
  }) {
    return ErrorModel(
      code: code ?? this.code,
      content: content ?? this.content,
      correction: correction ?? this.correction,
      severity: severity ?? this.severity,
      location: location ?? this.location,
    );
  }
}
