import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';


import './custom_analyze.dart';
import '../model/code_const.dart';
import '../model/error_model.dart';

class PrivateDeclareAnalyze extends CustomAnalyze {
  static const _whiteListVariable = [
    'resizeToAvoidBottomInset',
    'tapOutsideHideKeyBoard',
    'backgroundColor',
    'hasUseSafeArea',
  ];

  @override
  List<ErrorModel> analyze(ResolvedUnitResult input) {
    final listLint = <ErrorModel>[];
    try {
      final listElement =
          input.libraryElement.topLevelElements.where((element) {
        if (element.runtimeType.toString() == 'ClassElementImpl') {
          final classElement = element as ClassElement;
          if (classElement.supertype?.constructors.first.displayName ==
              'BasePageState') {
            return true;
          }
        }
        if (element.runtimeType.toString() == 'ExtensionElementImpl') {
          final extensionElement = element as ExtensionElement;
          if (extensionElement.extendedType.toString().contains('PageState')) {
            return true;
          }
        }
        return false;
      }).toList();

      if (listElement.isNotEmpty) {
        listLint.addAll(
          _checkPrivateFunction(
            listElement,
            input,
          ),
        );
      }
    } catch (_) {}

    return listLint;
  }

  List<ErrorModel> _checkPrivateFunction(
    List<Element> listElement,
    ResolvedUnitResult result,
  ) {
    final listLint = <ErrorModel>[];

    for (var element in listElement) {
      for (var children in element.children) {
        if (children.kind.displayName == 'method' ||
            children.kind.displayName == 'field') {
          if (!(children.hasOverride ||
              _whiteListVariable.any(
                (element) => element == children.name,
              ))) {
            if (children.isPublic) {
              final location = result.lintLocationFromOffset(
                children.nameOffset,
                length: children.nameLength,
              );
              listLint.add(
                CodeConst.privateForBehaviorFunction.copyWith(
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
