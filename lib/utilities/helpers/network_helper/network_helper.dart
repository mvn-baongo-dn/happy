import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:universal_html/html.dart' as html;

class NetworkHelper {
  NetworkHelper._();

  static Future<bool> checkConnectivity({required String baseUrl}) async {
    if (kIsWeb) {
      final isOnLine = html.window.navigator.onLine;
      if (isOnLine == null) {
        return false;
      } else {
        return isOnLine;
      }
    }
    final isOnLine =
        await Connectivity().checkConnectivity() != ConnectivityResult.none;
    if (isOnLine) {
      try {
        final url = Uri.parse(baseUrl);
        final result = await InternetAddress.lookup(url.host);
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          return true;
        }
      } on SocketException catch (_) {
        return false;
      }
    }
    return isOnLine;
  }
}
