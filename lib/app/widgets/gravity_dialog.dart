import 'package:flutter/material.dart';
import 'package:gravity_desktop_app_v2/app/theme/color_tokens.dart';
import 'package:gravity_desktop_app_v2/app/theme/spacing_tokens.dart';

enum GravityDialogTone { neutral, admin, danger }

class GravityDialog extends StatelessWidget {
  const GravityDialog({
    super.key,
    required this.title,
    required this.content,
    required this.actions,
    this.icon,
    this.tone = GravityDialogTone.neutral,
    this.maxWidth = 560,
  });

  final String title;
  final Widget content;
  final List<Widget> actions;
  final IconData? icon;
  final GravityDialogTone tone;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final toneColor = _toneColor(context);

    return Dialog(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (icon != null) ...[
                    Container(
                      padding: const EdgeInsets.all(AppSpacing.xs),
                      decoration: BoxDecoration(
                        color: AppColorTokens.statusSurface(
                          toneColor,
                          alpha: 0.12,
                        ),
                        borderRadius: AppRadius.mdBorder,
                      ),
                      child: Icon(icon, size: 24, color: toneColor),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                  ],
                  Expanded(
                    child: Text(title, style: theme.textTheme.titleLarge),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              DefaultTextStyle.merge(
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface,
                ),
                child: content,
              ),
              const SizedBox(height: AppSpacing.lg),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  for (var index = 0; index < actions.length; index += 1) ...[
                    if (index > 0) const SizedBox(width: AppSpacing.sm),
                    actions[index],
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _toneColor(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final appColors = context.appColors;
    return switch (tone) {
      GravityDialogTone.neutral => colorScheme.onSurfaceVariant,
      GravityDialogTone.admin => appColors.statusDebt,
      GravityDialogTone.danger => colorScheme.error,
    };
  }
}

Future<T?> showGravityDialog<T>({
  required BuildContext context,
  required String title,
  required Widget content,
  required List<Widget> actions,
  IconData? icon,
  GravityDialogTone tone = GravityDialogTone.neutral,
  bool barrierDismissible = true,
}) {
  return showDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (dialogContext) {
      return GravityDialog(
        title: title,
        content: content,
        actions: actions,
        icon: icon,
        tone: tone,
      );
    },
  );
}
