import 'package:cinebox/ui/core/themes/theme.dart';
import 'package:cinebox/ui/login/login_screen.dart';
import 'package:cinebox/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class CineboxAppMain extends StatelessWidget {
  const CineboxAppMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinebox Box',
      theme: AppTheme.theme,
      routes: {
        '/': (_) => const SplashScreen(),
        '/login': (_) => const LoginScreen(),
      },
    );
  }
}
