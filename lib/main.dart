import 'package:flutter/material.dart';
import 'package:mobiliz/core/app_theme.dart';
import 'package:mobiliz/core/config/router/router.dart';
import 'package:mobiliz/core/constants/app_constants.dart';
import 'package:mobiliz/features/home/map/viewmodel/map_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => MapViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConstants.appName,
      theme: AppTheme.instance.theme,
      routerConfig: AppRouter.instance.config(),
    );
  }
}
