import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:recipex_app/providers/theme_model.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Theme"),
                        IconButton(
                          icon: Icon(context.watch<ThemeModel>().isDark ? FontAwesomeIcons.lightbulb : FontAwesomeIcons.moon),
                          onPressed: () => context.read<ThemeModel>().toggle(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
