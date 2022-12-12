import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipex_app/providers/theme_model.dart';

import './providers/meal_list_provider.dart';
import './pages/home.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MealListProvider()),
        ChangeNotifierProvider(create: (_) => ThemeModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: context.watch<ThemeModel>().isDark ? ThemeModel.buildDarkTheme() : ThemeModel.buildLightTheme(),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
