import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:recipex_app/pages/login_page.dart';

import 'pages/home.dart';
import 'pages/intro_page.dart';
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
      child: const RecipexApp(),
    ),
  );
}

class RecipexApp extends StatefulWidget {
  const RecipexApp({super.key});

  @override
  State<RecipexApp> createState() => _RecipexAppState();
}

class _RecipexAppState extends State<RecipexApp> {

  Widget home = const Home();

  @override
  void initState() {
    if(context.read<StorageProvider>().isFirstTime){
      context.read<StorageProvider>().toggleFirstTime();
      home = const IntroPage();
    }
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
      ],
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MaterialApp(
        title: "RecipEx App",
        theme: context.watch<ThemeModel>().isDark
            ? ThemeModel.buildDarkTheme()
            : ThemeModel.buildLightTheme(),
        debugShowCheckedModeBanner: false,
        home: const LoginPage(),
      ),
    );
  }
}
