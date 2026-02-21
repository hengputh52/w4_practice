import 'package:flutter/material.dart';
import '../../../providers/theme_color_provider.dart';
import 'package:provider/provider.dart';


class ThemeColorButton extends StatelessWidget {
  const ThemeColorButton({
    super.key,
    required this.themeColor,


  });

  final ThemeColor themeColor;





  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeColorProvider>();
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: GestureDetector(
        onTap: () => themeProvider.onTap(themeColor),
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: themeColor.color,
            borderRadius: BorderRadius.circular(20),
            border: themeProvider.getBorder(themeColor),
          ),
        ),
      ),
    );
  }
}
