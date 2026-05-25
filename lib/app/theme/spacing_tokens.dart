import 'package:flutter/material.dart';

abstract final class AppSpacing {
  static const double xxs = 4;
  static const double xs = 8;
  static const double sm = 12;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
}

abstract final class AppRadius {
  static const double sm = 4;
  static const double md = 8;

  static BorderRadius get smBorder => BorderRadius.circular(sm);
  static BorderRadius get mdBorder => BorderRadius.circular(md);
}

abstract final class AppMotion {
  static const Duration fast = Duration(milliseconds: 120);
  static const Duration standard = Duration(milliseconds: 180);
}
