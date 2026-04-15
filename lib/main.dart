import 'package:flutter/material.dart';
import 'package:pos_admin/screens/main_screen.dart';
import 'package:pos_admin/theme/app_theme.dart';

void main() {
  runApp(AppTheme.mixLight(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light(context),
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}
