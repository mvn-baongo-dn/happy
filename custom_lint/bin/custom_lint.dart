import 'dart:isolate';

import 'package:analyzer/dart/analysis/results.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';


import './analyze/behavior_function_analyze.dart';
import './analyze/check_context_analyze.dart';
import './analyze/force_null_safety_analyze.dart';
import './analyze/import_analyze.dart';
import './analyze/private_function_analyze.dart';
import './model/error_model.dart';

// This is the entrypoint of our custom linter

void main(List<String> args, SendPort sendPort) {
  startPlugin(sendPort, _CleanCustomLint());
}

class _CleanCustomLint extends PluginBase {
  final _checkContextAnalyze = CheckContextAnalyze();
  final _importLint = ImportAnalyze();
  final _declareLint = PrivateDeclareAnalyze();
  final _nullSafety = ForceNullSafetyAnalyze();
  final _behaviorFunction = BehaviorFunctionAnalyze();

  @override
  Stream<Lint> getLints(ResolvedUnitResult result) async* {
    final listLint = <ErrorModel>[];
    listLint.addAll(
      [
        ..._checkContextAnalyze.analyze(result),
        ..._importLint.analyze(result),
        ..._declareLint.analyze(result),
        ..._nullSafety.analyze(result),
        ..._behaviorFunction.analyze(result),
      ],
    );
    for (var lint in listLint) {
      final location = lint.location;
      if (location != null) {
        yield Lint(
          code: lint.code,
          message: lint.message,
          location: location,
          severity: lint.severity,
          correction: lint.correction,
        );
      }
    }
  }
}
