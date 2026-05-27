import 'package:flutter/material.dart';

class ScaledAppShell extends StatelessWidget {
  const ScaledAppShell({super.key, required this.scale, required this.child});

  static const Key transformKey = Key('scaledAppShell.transform');

  final double scale;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (scale == 1.0) {
      return child;
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        if (!constraints.hasBoundedWidth || !constraints.hasBoundedHeight) {
          return child;
        }

        return ClipRect(
          child: Transform.scale(
            key: transformKey,
            scale: scale,
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: constraints.maxWidth / scale,
              height: constraints.maxHeight / scale,
              child: child,
            ),
          ),
        );
      },
    );
  }
}
