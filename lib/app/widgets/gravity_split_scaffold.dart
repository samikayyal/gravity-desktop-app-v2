import 'package:flutter/material.dart';
import 'package:gravity_desktop_app_v2/app/theme/spacing_tokens.dart';

class GravitySplitScaffold extends StatelessWidget {
  const GravitySplitScaffold({
    super.key,
    required this.leftPanel,
    required this.rightPanel,
    this.leadingNavigation,
    this.leftFlex = 6,
    this.rightFlex = 4,
    this.transitionDuration = AppMotion.standard,
  }) : assert(leftFlex > 0),
       assert(rightFlex > 0);

  static const ValueKey<String> leftPanelKey = ValueKey<String>(
    'gravitySplitScaffold.leftPanel',
  );
  static const ValueKey<String> rightPanelKey = ValueKey<String>(
    'gravitySplitScaffold.rightPanel',
  );

  final Widget leftPanel;
  final Widget rightPanel;
  final Widget? leadingNavigation;
  final int leftFlex;
  final int rightFlex;
  final Duration transitionDuration;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Row(
        children: [
          if (leadingNavigation != null) ...[
            leadingNavigation!,
            const VerticalDivider(width: 1, thickness: 1),
          ],
          Expanded(
            child: Row(
              children: [
                Expanded(
                  key: leftPanelKey,
                  flex: leftFlex,
                  child: ColoredBox(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: leftPanel,
                  ),
                ),
                const VerticalDivider(width: 1, thickness: 1),
                Expanded(
                  key: rightPanelKey,
                  flex: rightFlex,
                  child: ColoredBox(
                    color: colorScheme.surface,
                    child: AnimatedSwitcher(
                      duration: transitionDuration,
                      switchInCurve: Curves.easeOut,
                      switchOutCurve: Curves.easeIn,
                      child: rightPanel,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
