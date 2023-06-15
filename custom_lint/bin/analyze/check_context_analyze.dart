import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';


import './custom_analyze.dart';
import '../model/code_const.dart';
import '../model/error_model.dart';

class CheckContextAnalyze extends CustomAnalyze {
  static const _whiteListSupperType = [
    'BasePageState',
    'StatelessWidget',
    'StatefulWidget',
    'BaseDialog',
    'State',
  ];

  @override
  List<ErrorModel> analyze(ResolvedUnitResult input) {
    final listLint = <ErrorModel>[];
    try {
      final listClass =
          input.libraryElement.topLevelElements.whereType<ClassElement>().where(
        (classElement) {
          if (_whiteListSupperType.contains(classElement.displayName)) {
            return false;
          }

          return !_whiteListSupperType.any(
            (supperType) =>
                classElement.supertype?.constructors.first.displayName ==
                supperType,
          );
        },
      ).toList();

      if (listClass.isNotEmpty) {
        listLint.addAll(
          _checkParamContext(
            listClass,
          ),
        );
      }
    } catch (_) {}
    return listLint;
  }

  List<ErrorModel> _checkParamContext(
    List<ClassElement> listClass,
  ) {
    final listLint = <ErrorModel>[];
    for (var clazz in listClass) {
      for (var method in clazz.methods) {
        if (method.parameters.isNotEmpty) {
          for (var parameter in method.parameters) {
            final typeName = parameter.type.toString();
            final location = parameter.nameLintLocation;
            if (typeName.contains('BuildContext') && location != null) {
              listLint.add(
                CodeConst.contextWithoutUi.copyWith(
                  location: location,
                ),
              );
            }
          }
        }
      }
    }
    return listLint;
  }
}
