import 'package:flutter/material.dart';

import 'shell/foundation_shell.dart';
import 'theme/app_theme.dart';

class GravityDesktopApp extends StatelessWidget {
  const GravityDesktopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gravity Front Desk',
      theme: buildAppTheme(),
      home: const FoundationShell(),
    );
  }
}
