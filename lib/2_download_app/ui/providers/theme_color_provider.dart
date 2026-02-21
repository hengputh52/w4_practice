import 'package:flutter/material.dart';
import 'package:w4_practice/2_download_app/ui/theme/theme.dart';

enum ThemeColor {
  blue(color: Color.fromARGB(255, 34, 118, 229)),
  green(color: Color.fromARGB(255, 229, 158, 221)),
  pink(color: Color.fromARGB(255, 156, 202, 8));

  const ThemeColor({required this.color});

  final Color color;
  Color get backgroundColor => color.withAlpha(100);
}

class ThemeColorProvider extends ChangeNotifier {
  ThemeColor _currentThemeColor = ThemeColor.blue;

  ThemeColor get currentThemeColor => _currentThemeColor;

    BoxBorder? getBorder(ThemeColor themeColor) {
      return themeColor == _currentThemeColor ?
      Border.all(color: AppColors.neutral, width: 6) : null;
    }
  void onTap(ThemeColor themColor) {
    _currentThemeColor = themColor;
    notifyListeners();
  }
}
