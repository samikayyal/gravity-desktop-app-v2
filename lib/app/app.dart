import 'package:flutter/material.dart';

import 'setup_gate.dart';
import 'theme/app_theme.dart';

class GravityDesktopApp extends StatelessWidget {
  const GravityDesktopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gravity Front Desk',
      theme: buildAppTheme(),
      home: const SetupGate(),
    );
  }
}
