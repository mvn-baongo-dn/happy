// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:happy/utilities/extensions/extensions.dart';

class ErrorHelper {
  ErrorHelper._();

  static String getError(Object? error) {
    String errorMessage;
    final unknownError = 'err';
    if (error is DioError) {
      final response = error.response;
      if (response != null) {
        try {
          errorMessage = response.data is String
              ? jsonDecode(response.data as String)['error'] as String
              : response.data['error'] as String;
        } catch (_) {
          errorMessage = error.response?.statusMessage ?? unknownError;
        }
      } else {
        errorMessage =
            error.message.isNullOrBlank ? unknownError : error.message;
      }
    } else if (error is Exception) {
      errorMessage = error.toString();
    } else {
      errorMessage = unknownError;
    }
    return errorMessage;
  }
}
