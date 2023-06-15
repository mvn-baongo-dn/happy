import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';


import './custom_analyze.dart';
import '../model/code_const.dart';
import '../model/error_model.dart';

class ImportAnalyze extends CustomAnalyze {
  @override
  List<ErrorModel> analyze(ResolvedUnitResult input) {
    final listLint = <ErrorModel>[];
    try {
      final fileCheck = input.libraryElement;
      fileCheck.libraryImports.forEach((lib) {
        final name = (lib.uri as DirectiveUriWithLibrary).relativeUriString;
        if (name.substring(0, 3) != '../' &&
            name.substring(0, 2) != './' &&
            !name.contains(':')) {
          final location = input.lintLocationFromOffset(
            lib.nameOffset,
            length: 'import \'$name;\''.length,
          );
          listLint.add(
            CodeConst.importError.copyWith(
              location: location,
              correction: '• import \'./$name\';',
            ),
          );
        }
      });
    } catch (_) {}
    return listLint;
  }
}
