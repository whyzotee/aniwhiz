import 'package:aniwhiz/app/core/app.theme.dart';
import 'package:flutter/material.dart';
import 'package:aniwhiz/app/modules/home/widgets/bottom_nav.widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const BottomNavigator(), theme: AppTheme.theme);
  }
}
