import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

/// Resource: https://pub.dev/packages/responsive_framework

Widget getResponsiveWrapper(BuildContext context, Widget? widget) =>
    ResponsiveWrapper.builder(
      // ignore: force_null_safety
      BouncingScrollWrapper.builder(context, widget!),
      maxWidth: kIsWeb ? 800 : null,
      minWidth: 300,
      breakpoints: [
        const ResponsiveBreakpoint.autoScale(799, name: TABLET),
        const ResponsiveBreakpoint.autoScale(2460, name: '4K'),
      ],
      background: Container(
        color: const Color(0xFFF5F5F5),
      ),
    );
