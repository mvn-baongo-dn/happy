import 'dart:io';

import 'package:custom_lint/basic_runner.dart';


void main() {
  customLint(workingDirectory: Directory.current.parent);
}
