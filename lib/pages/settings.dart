import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipex_app/providers/theme_model.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: GlobalKey(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: Text(
              "SETTINGS",
              style: Theme.of(context).appBarTheme.toolbarTextStyle,
            ),
            toolbarTextStyle: Theme.of(context).appBarTheme.toolbarTextStyle,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Dark mode",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Switch(
                        value: context.watch<ThemeModel>().isDark,
                        thumbColor: const MaterialStatePropertyAll(
                          Colors.white
                        ),
                        trackColor: context.watch<ThemeModel>().isDark ? const MaterialStatePropertyAll( Colors.blue ) : const MaterialStatePropertyAll( Colors.black) ,
                        thumbIcon: const MaterialStatePropertyAll<Icon>(
                          Icon(
                            Icons.dark_mode_rounded,
                            color: Colors.black87,
                          ),
                        ),
                        onChanged: (value) => context.read<ThemeModel>().toggle(),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
