import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'pages/home.dart';
import 'pages/intro_page.dart';
import 'providers/misc_provider.dart';
import 'providers/storage_provider.dart';
import 'providers/theme_model.dart';
import './providers/meal_list_provider.dart';

void main() async {

  await Hive.initFlutter();
  await Hive.openBox('recipex');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MealListProvider()),
        ChangeNotifierProvider(create: (_) => ThemeModel()),
        ChangeNotifierProvider(create: (_) => StorageProvider()),
        ChangeNotifierProvider(create: (_) => MiscellaneousProvider()),
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

  @override
  void initState() {
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
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const Home();
            }
            else {
              return const IntroPage();
            }
          },
        ),
      ),
    );
  }
}
