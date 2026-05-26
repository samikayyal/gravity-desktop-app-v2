import 'package:flutter/material.dart';
import 'package:gravity_desktop_app_v2/app/theme/color_tokens.dart';
import 'package:gravity_desktop_app_v2/app/theme/spacing_tokens.dart';

enum GravityStatusTone {
  active,
  nearEnd,
  overdue,
  stale,
  debt,
  closed,
  cloudOk,
  cloudError,
  neutral,
}

class GravityStatusChip extends StatefulWidget {
  const GravityStatusChip({
    super.key,
    required this.label,
    required this.tone,
    this.icon,
    this.filled = true,
    this.flashing = false,
    this.compact = false,
    this.showDot = false,
  });

  const GravityStatusChip.active({
    super.key,
    required this.label,
    this.compact = false,
  }) : tone = GravityStatusTone.active,
       icon = Icons.circle,
       filled = true,
       flashing = false,
       showDot = false;

  const GravityStatusChip.nearEnd({
    super.key,
    required this.label,
    this.compact = false,
  }) : tone = GravityStatusTone.nearEnd,
       icon = Icons.warning_amber_rounded,
       filled = true,
       flashing = false,
       showDot = false;

  const GravityStatusChip.overdue({
    super.key,
    required this.label,
    this.compact = false,
  }) : tone = GravityStatusTone.overdue,
       icon = Icons.close,
       filled = true,
       flashing = true,
       showDot = false;

  const GravityStatusChip.debt({
    super.key,
    required this.label,
    this.compact = false,
  }) : tone = GravityStatusTone.debt,
       icon = Icons.priority_high,
       filled = false,
       flashing = false,
       showDot = false;

  const GravityStatusChip.closed({
    super.key,
    required this.label,
    this.compact = false,
  }) : tone = GravityStatusTone.closed,
       icon = Icons.radio_button_unchecked,
       filled = true,
       flashing = false,
       showDot = false;

  const GravityStatusChip.sync({
    super.key,
    required this.label,
    required this.tone,
  }) : icon = null,
       filled = false,
       flashing = false,
       compact = true,
       showDot = true;

  final String label;
  final GravityStatusTone tone;
  final IconData? icon;
  final bool filled;
  final bool flashing;
  final bool compact;
  final bool showDot;

  @override
  State<GravityStatusChip> createState() => _GravityStatusChipState();
}

class _GravityStatusChipState extends State<GravityStatusChip>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: AppMotion.standard,
    );
    _opacity = Tween<double>(
      begin: 0.78,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    if (widget.flashing) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(covariant GravityStatusChip oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.flashing && !_controller.isAnimating) {
      _controller.repeat(reverse: true);
    } else if (!widget.flashing && _controller.isAnimating) {
      _controller.stop();
      _controller.value = 1;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final child = _buildChip(context);
    if (!widget.flashing) {
      return child;
    }

    return FadeTransition(opacity: _opacity, child: child);
  }

  Widget _buildChip(BuildContext context) {
    final theme = Theme.of(context);
    final baseColor = _baseColor(context);
    final backgroundColor = widget.filled
        ? baseColor
        : AppColorTokens.statusSurface(baseColor, alpha: 0.12);
    final foregroundColor = widget.filled
        ? _bestForeground(context, baseColor)
        : baseColor;
    final horizontalPadding = widget.compact ? AppSpacing.xs : AppSpacing.sm;
    final verticalPadding = widget.compact ? 2.0 : AppSpacing.xxs;

    return DecoratedBox(
      key: ValueKey<String>('gravityStatusChip.${widget.tone.name}'),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: AppRadius.smBorder,
        border: Border.all(
          color: widget.filled ? baseColor : baseColor.withValues(alpha: 0.45),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.showDot)
              Container(
                width: 7,
                height: 7,
                decoration: BoxDecoration(
                  color: baseColor,
                  shape: BoxShape.circle,
                ),
              )
            else if (widget.icon != null)
              Icon(widget.icon, size: 12, color: foregroundColor),
            if (widget.showDot || widget.icon != null)
              const SizedBox(width: AppSpacing.xxs),
            Flexible(
              child: Text(
                widget.label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: foregroundColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _baseColor(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final appColors = context.appColors;

    return switch (widget.tone) {
      GravityStatusTone.active => appColors.statusActive,
      GravityStatusTone.nearEnd => appColors.statusNearEnd,
      GravityStatusTone.overdue => appColors.statusOverdue,
      GravityStatusTone.stale => appColors.statusStale,
      GravityStatusTone.debt => appColors.statusDebt,
      GravityStatusTone.closed => colorScheme.onSurfaceVariant,
      GravityStatusTone.cloudOk => appColors.statusCloudOk,
      GravityStatusTone.cloudError => appColors.statusCloudError,
      GravityStatusTone.neutral => colorScheme.outline,
    };
  }

  Color _bestForeground(BuildContext context, Color background) {
    final colorScheme = Theme.of(context).colorScheme;
    final dark = colorScheme.onSurface;
    final light = colorScheme.surface;
    return _contrastRatio(background, dark) >= _contrastRatio(background, light)
        ? dark
        : light;
  }

  double _contrastRatio(Color a, Color b) {
    final luminanceA = a.computeLuminance();
    final luminanceB = b.computeLuminance();
    final lighter = luminanceA > luminanceB ? luminanceA : luminanceB;
    final darker = luminanceA > luminanceB ? luminanceB : luminanceA;
    return (lighter + 0.05) / (darker + 0.05);
  }
}
