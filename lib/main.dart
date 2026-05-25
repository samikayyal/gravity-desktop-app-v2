import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:window_manager/window_manager.dart';
import 'package:gravity_desktop_app_v2/app/app.dart';
import 'package:gravity_desktop_app_v2/core/config/env_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Load local configuration from filesystem
  await EnvConfig.initialize();

  // 2. Initialize Window Manager configuration
  await windowManager.ensureInitialized();
  const WindowOptions windowOptions = WindowOptions(
    size: Size(1920, 1080),
    minimumSize: Size(1024, 768),
    center: true,
    title: 'Gravity Cashier Desk',
  );
  await windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
    // Default to maximized on cashier display
    await windowManager.maximize();
  });

  runApp(const ProviderScope(child: GravityApp()));
}
