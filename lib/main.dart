import 'package:flutter/material.dart';
import 'package:mobiliz/core/app_theme.dart';
import 'package:mobiliz/features/home/home_shell.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobiliz',
      home: HomeView(),
      theme: AppTheme.theme,
    );
  }
}
