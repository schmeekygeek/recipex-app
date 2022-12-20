import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                        "Theme mode",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      ToggleButtons(
                        fillColor: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(6),
                        borderWidth: 0,
                        isSelected: [
                          !context.watch<ThemeModel>().isDark,
                          context.watch<ThemeModel>().isDark,
                        ],
                        onPressed: (index) {
                          context.read<ThemeModel>().toggle();
                        },
                        children: [
                          IconButton(
                            icon: const Icon(
                              FontAwesomeIcons.solidLightbulb,
                            ),
                            onPressed: () => context.read<ThemeModel>().isDark
                                ? context.read<ThemeModel>().toggle()
                                : {},
                            style: Theme.of(context).textButtonTheme.style,
                          ),
                          IconButton(
                            icon: const Icon(FontAwesomeIcons.solidMoon),
                            onPressed: () => !context.read<ThemeModel>().isDark
                                ? context.read<ThemeModel>().toggle()
                                : {},
                            style: Theme.of(context).textButtonTheme.style,
                          ),
                        ],
                      ),
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
