import 'package:analyzer/dart/analysis/results.dart';

import '../model/error_model.dart';

abstract class CustomAnalyze {
  List<ErrorModel> analyze(ResolvedUnitResult input);
}
