import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color(0xFFF7F8FC);
  static const Color primary = Color(0xFF6C5CE7);
  static const Color secondary = Color(0xFF8E44AD);
  static const Color accentPink = Color(0xFFFF6FD8);
  static const Color darkNavy = Color(0xFF1E1B4B);
  static const Color sidebarWhite = Colors.white;
  static const Color cardWhite = Colors.white;
  static const Color textMain = Color(0xFF222222);
  static const Color textSub = Color(0xFF777777);
  static const Color border = Color(0xFFECECEC);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, accentPink],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

