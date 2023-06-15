import 'package:analyzer/dart/analysis/results.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';


import './custom_analyze.dart';
import '../model/code_const.dart';
import '../model/error_model.dart';

class ForceNullSafetyAnalyze extends CustomAnalyze {
  static const _regexForce = r'([a-zA-Z]\![a-zA-Z\s\.;,\)])';

  @override
  List<ErrorModel> analyze(ResolvedUnitResult input) {
    final listLint = <ErrorModel>[];
    try {
      final match = RegExp(_regexForce).allMatches(input.content);
      match.forEach((e) {
        final location = input.lintLocationFromOffset(
          e.start,
          length: e.end - e.start - 1,
        );
        listLint.add(
          CodeConst.forceNullSafety.copyWith(location: location),
        );
      });
    } catch (_) {}
    return listLint;
  }
}
