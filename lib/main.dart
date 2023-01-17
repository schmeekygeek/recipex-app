import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'pages/home.dart';
import 'providers/storage_provider.dart';
import 'providers/theme_model.dart';

import './providers/meal_list_provider.dart';

void main() async {

  await Hive.initFlutter();
  await Hive.openBox('recipex');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MealListProvider()),
        ChangeNotifierProvider(create: (_) => ThemeModel()),
        ChangeNotifierProvider(create: (_) => StorageProvider()),
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
      title: "RecipEx App",
      theme: context.watch<ThemeModel>().isDark ? ThemeModel.buildDarkTheme() : ThemeModel.buildLightTheme(),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
