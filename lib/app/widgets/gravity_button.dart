import 'package:flutter/material.dart';
import 'package:gravity_desktop_app_v2/app/theme/color_tokens.dart';
import 'package:gravity_desktop_app_v2/app/theme/spacing_tokens.dart';

enum _GravityButtonVariant { primary, secondary, danger, quickAdd, iconOnly }

class GravityButton extends StatelessWidget {
  const GravityButton.primary({
    super.key,
    required this.label,
    required this.onPressed,
    this.leadingIcon,
    this.expand = false,
  }) : _variant = _GravityButtonVariant.primary,
       tooltip = null,
       iconOnly = null;

  const GravityButton.secondary({
    super.key,
    required this.label,
    required this.onPressed,
    this.leadingIcon,
    this.expand = false,
  }) : _variant = _GravityButtonVariant.secondary,
       tooltip = null,
       iconOnly = null;

  const GravityButton.danger({
    super.key,
    required this.label,
    required this.onPressed,
    this.leadingIcon,
    this.expand = false,
  }) : _variant = _GravityButtonVariant.danger,
       tooltip = null,
       iconOnly = null;

  const GravityButton.quickAdd({
    super.key,
    required this.label,
    required this.onPressed,
    this.expand = false,
  }) : _variant = _GravityButtonVariant.quickAdd,
       leadingIcon = Icons.add,
       tooltip = null,
       iconOnly = null;

  const GravityButton.icon({
    super.key,
    required IconData icon,
    required this.tooltip,
    required this.onPressed,
  }) : _variant = _GravityButtonVariant.iconOnly,
       label = null,
       leadingIcon = null,
       iconOnly = icon,
       expand = false;

  final String? label;
  final VoidCallback? onPressed;
  final IconData? leadingIcon;
  final IconData? iconOnly;
  final String? tooltip;
  final bool expand;
  final _GravityButtonVariant _variant;

  @override
  Widget build(BuildContext context) {
    if (_variant == _GravityButtonVariant.iconOnly) {
      return IconButton(
        icon: Icon(iconOnly, size: 20),
        tooltip: tooltip,
        onPressed: onPressed,
        style: _iconStyle(context),
      );
    }

    final child = _buildLabeledButton(context);
    return SizedBox(
      width: expand ? double.infinity : null,
      height: _height,
      child: child,
    );
  }

  Widget _buildLabeledButton(BuildContext context) {
    final child = leadingIcon == null
        ? _buildLabelText()
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(leadingIcon, size: 18),
              const SizedBox(width: AppSpacing.xs),
              Flexible(child: _buildLabelText()),
            ],
          );

    return switch (_variant) {
      _GravityButtonVariant.secondary => OutlinedButton(
        onPressed: onPressed,
        style: _buttonStyle(context),
        child: child,
      ),
      _ => FilledButton(
        onPressed: onPressed,
        style: _buttonStyle(context),
        child: child,
      ),
    };
  }

  Widget _buildLabelText() {
    return Text(
      label!,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      softWrap: false,
      textAlign: TextAlign.center,
    );
  }

  double get _height {
    return switch (_variant) {
      _GravityButtonVariant.quickAdd => 40,
      _ => 48,
    };
  }

  ButtonStyle _buttonStyle(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final colors = _ButtonColors.forVariant(_variant, colorScheme);

    return ButtonStyle(
      minimumSize: WidgetStatePropertyAll(Size(0, _height)),
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: AppSpacing.md),
      ),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      elevation: const WidgetStatePropertyAll(0),
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return colors.background.withValues(alpha: 0.4);
        }
        if (states.contains(WidgetState.hovered) ||
            states.contains(WidgetState.pressed)) {
          return colors.hoverBackground;
        }
        return colors.background;
      }),
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return colors.foreground.withValues(alpha: 0.4);
        }
        return colors.foreground;
      }),
      overlayColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.focused)) {
          return AppColorTokens.brandPrimaryContainer.withValues(alpha: 0.35);
        }
        if (states.contains(WidgetState.pressed)) {
          return colors.foreground.withValues(alpha: 0.08);
        }
        return null;
      }),
      side: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.focused)) {
          return BorderSide(color: colors.focusBorder, width: 2);
        }
        return BorderSide(color: colors.border);
      }),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: AppRadius.mdBorder),
      ),
      textStyle: WidgetStatePropertyAll(
        theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700),
      ),
      mouseCursor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return SystemMouseCursors.basic;
        }
        return SystemMouseCursors.click;
      }),
      animationDuration: AppMotion.fast,
    );
  }

  ButtonStyle _iconStyle(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return theme.iconButtonTheme.style?.merge(
          ButtonStyle(
            side: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.focused)) {
                return BorderSide(color: colorScheme.primary, width: 2);
              }
              return BorderSide(color: colorScheme.outline);
            }),
          ),
        ) ??
        ButtonStyle(
          minimumSize: const WidgetStatePropertyAll(Size(36, 36)),
          fixedSize: const WidgetStatePropertyAll(Size(36, 36)),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: AppRadius.smBorder),
          ),
        );
  }
}

class _ButtonColors {
  const _ButtonColors({
    required this.background,
    required this.hoverBackground,
    required this.foreground,
    required this.border,
    required this.focusBorder,
  });

  factory _ButtonColors.forVariant(
    _GravityButtonVariant variant,
    ColorScheme colorScheme,
  ) {
    return switch (variant) {
      _GravityButtonVariant.secondary => _ButtonColors(
        background: Colors.transparent,
        hoverBackground: AppColorTokens.neutralBackground,
        foreground: colorScheme.onSurface,
        border: colorScheme.onSurface,
        focusBorder: colorScheme.primary,
      ),
      _GravityButtonVariant.danger => _ButtonColors(
        background: colorScheme.error,
        hoverBackground: AppColorTokens.shiftLightness(
          colorScheme.error,
          -0.05,
        ),
        foreground: colorScheme.onError,
        border: colorScheme.error,
        focusBorder: colorScheme.onSurface,
      ),
      _GravityButtonVariant.quickAdd => _ButtonColors(
        background: colorScheme.primaryContainer,
        hoverBackground: AppColorTokens.shiftLightness(
          colorScheme.primaryContainer,
          -0.05,
        ),
        foreground: colorScheme.onPrimaryContainer,
        border: colorScheme.outline,
        focusBorder: colorScheme.primary,
      ),
      _ => _ButtonColors(
        background: colorScheme.primary,
        hoverBackground: AppColorTokens.shiftLightness(
          colorScheme.primary,
          -0.05,
        ),
        foreground: colorScheme.onPrimary,
        border: colorScheme.outline,
        focusBorder: colorScheme.onSurface,
      ),
    };
  }

  final Color background;
  final Color hoverBackground;
  final Color foreground;
  final Color border;
  final Color focusBorder;
}
