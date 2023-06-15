import 'package:flutter/material.dart';

import '../../../utilities/constants/responsive_boundary.dart';
import '../../../utilities/extensions/extensions.dart';

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    required this.mobile,
    required this.tablet,
    this.desktop,
    Key? key,
  }) : super(key: key);

  final Widget mobile;
  final Widget tablet;
  final Widget? desktop;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          desktop?.safe((it) {
            if (constraints.maxWidth >= ResponsiveBoundary.minDesktop) {
              return it;
            } else if (constraints.maxWidth >= ResponsiveBoundary.minTablet) {
              return tablet;
            }
          });
          return mobile;
        },
      );
}
