import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';


import './custom_analyze.dart';
import '../model/code_const.dart';
import '../model/error_model.dart';

class BehaviorFunctionAnalyze extends CustomAnalyze {
  static const _whiteList = [
    'Widget',
    'Widget?',
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
        if (!_checkReturnTypeHasUi(children)) {
          final location = result.lintLocationFromOffset(
            children.nameOffset,
            length: children.nameLength,
          );
          listLint.add(
            CodeConst.behaviorFunction.copyWith(
              location: location,
            ),
          );
        }
      }
    }

    return listLint;
  }

  bool _checkReturnTypeHasUi(Element children) {
    if (children.kind.displayName == 'method' && !children.hasOverride) {
      final returnType = (children as MethodElement).returnType;
      return _checkTypeArgumentHasUi(returnType);
    }
    return true;
  }

  bool _checkTypeArgumentHasUi(DartType returnType) {
    if (returnType is InterfaceType) {
      final typeArgs = returnType.typeArguments;
      if (typeArgs.isEmpty) {
        return _checkSingleTypeIsUi(returnType);
      } else {
        for (var typeArg in typeArgs) {
          if (_checkTypeArgumentHasUi(typeArg)) {
            return true;
          }
        }
      }
    }
    return false;
  }

  bool _checkSingleTypeIsUi(DartType returnType) {
    if (returnType is InterfaceType) {
      // Case return a widget
      final name = returnType.getDisplayString(withNullability: true);
      if (_whiteList.contains(name)) {
        return true;
      }

      // Case return a class extend widget
      final supperTypes = returnType.allSupertypes.map(
        (e) => e.getDisplayString(withNullability: true),
      );
      for (var supperType in supperTypes) {
        if (_whiteList.contains(supperType)) {
          return true;
        }
      }
    }
    return false;
  }
}
