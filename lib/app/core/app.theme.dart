import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static Route routeAnimation(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: FadeTransition(opacity: animation, child: child),
        );
      },
    );
  }

  static void push(Widget page, c) {
    Navigator.push(c, routeAnimation(page));
  }

  static ThemeData theme = ThemeData(
    appBarTheme: const AppBarTheme(
      scrolledUnderElevation: 0.0,
      surfaceTintColor: Colors.transparent,
    ),
  );

  static Color cBlack = const Color(0xFF252525);

  static TextStyle font24black = TextStyle(
    color: cBlack,
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );

  static TextStyle font16black = TextStyle(
    color: cBlack,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static TextStyle font24White = const TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );

  static TextStyle font16White = const TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static TextStyle font12White = const TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
}
