import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_desktop_app_v2/app/localization/localization_extensions.dart';
import 'package:gravity_desktop_app_v2/app/widgets/gravity_button.dart';
import 'package:gravity_desktop_app_v2/app/widgets/gravity_dialog.dart';
import 'package:gravity_desktop_app_v2/app/widgets/gravity_text_field.dart';
import 'package:gravity_desktop_app_v2/core/security/admin_auth_notifier.dart';

class AdminPasswordDialog extends ConsumerStatefulWidget {
  const AdminPasswordDialog({super.key});

  @override
  ConsumerState<AdminPasswordDialog> createState() =>
      _AdminPasswordDialogState();
}

class _AdminPasswordDialogState extends ConsumerState<AdminPasswordDialog> {
  final TextEditingController _passwordController = TextEditingController();

  String? _errorText;
  bool _isChecking = false;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GravityDialog(
      title: context.l10n.titleAdminUnlockDialog,
      icon: Icons.lock_open_outlined,
      tone: GravityDialogTone.admin,
      content: GravityTextField.blind(
        key: const Key('settings.adminUnlockPassword'),
        label: context.l10n.labelAdminPassword,
        controller: _passwordController,
        helperText: context.l10n.helperEnterPassword,
        errorText: _errorText,
        autofocus: true,
        textInputAction: TextInputAction.done,
        revealTooltip: context.l10n.tooltipRevealPassword,
        hideTooltip: context.l10n.tooltipHidePassword,
        onFieldSubmitted: (_) => _tryUnlock(),
      ),
      actions: [
        GravityButton.secondary(
          label: context.l10n.btnCancel,
          onPressed: _isChecking
              ? null
              : () => Navigator.of(context).pop(false),
        ),
        GravityButton.primary(
          label: _isChecking
              ? context.l10n.labelChecking
              : context.l10n.btnUnlock,
          leadingIcon: Icons.lock_open_outlined,
          onPressed: _isChecking ? null : _tryUnlock,
        ),
      ],
    );
  }

  Future<void> _tryUnlock() async {
    if (_passwordController.text.trim().length < 4) {
      setState(() {
        _errorText = context.l10n.msgInvalidAdminPasswordLength;
      });
      return;
    }

    setState(() {
      _isChecking = true;
      _errorText = null;
    });

    final bool isValidPassword;
    try {
      isValidPassword = await ref
          .read(adminAuthControllerProvider.notifier)
          .unlockWithPassword(_passwordController.text);
    } catch (_) {
      if (!mounted) {
        return;
      }
      setState(() {
        _isChecking = false;
        _errorText = context.l10n.msgAdminUnlockFailed;
      });
      return;
    }

    if (!mounted) {
      return;
    }

    if (isValidPassword) {
      Navigator.of(context).pop(true);
      return;
    }

    setState(() {
      _isChecking = false;
      _errorText = context.l10n.msgAdminUnlockFailed;
    });
  }
}
