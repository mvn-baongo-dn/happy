

import 'package:custom_lint_builder/custom_lint_builder.dart';

import './error_model.dart';

class CodeConst {
  CodeConst._();

  static const contextWithoutUi = ErrorModel(
    code: 'context_without_ui',
    content: 'Don\'t use BuildContext outside of UI',
    severity: LintSeverity.warning,
  );

  static const importError = ErrorModel(
    code: 'import_relative_path',
    content: 'Use relative import',
    severity: LintSeverity.warning,
  );

  static const privateForBehaviorFunction = ErrorModel(
    code: 'private_function_and_variable',
    content:
        'Don\'t use public function or variable which only use inside class',
    severity: LintSeverity.warning,
  );

  static const behaviorFunction = ErrorModel(
    code: 'behavior_function',
    content:
        'Self-defined methods that are not related to ui should be written in behavior extension',
    severity: LintSeverity.warning,
  );

  static const forceNullSafety = ErrorModel(
    code: 'force_null_safety',
    content: 'Don\'t use force `!`, should use null safety',
    severity: LintSeverity.warning,
  );
}
