import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../providers/misc_provider.dart';
import '../providers/theme_model.dart';
import '../shared/settings_widgets/settings_section.dart';
import '../shared/settings_widgets/title.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: GlobalKey(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              collapseMode: CollapseMode.parallax,
              titlePadding: const EdgeInsetsDirectional.all(12),
              expandedTitleScale: 1.3,
              title: Text(
                'Settings',
                style: Theme.of(context).appBarTheme.toolbarTextStyle,
              ),
            ),
            toolbarTextStyle: Theme.of(context).appBarTheme.toolbarTextStyle,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const SettingsTitle(
                    icon: FontAwesomeIcons.solidUser,
                    text: 'Account',
                  ),
                  SettingsSection(
                    child: Column(
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            // TODO add implement reset password
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Coming soon'),
                              ),
                            );
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Reset password'),
                              Icon(
                                FontAwesomeIcons.chevronRight,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          color: Colors.blueGrey,
                          thickness: 0.3,
                          height: 20,
                          indent: 8,
                          endIndent: 8,
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            // TODO add implement reset username
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Coming soon'),
                              ),
                            );
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Reset username'),
                              Icon(
                                FontAwesomeIcons.chevronRight,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SettingsTitle(
                    icon: FontAwesomeIcons.paintbrush,
                    text: 'Appearance',
                  ),
                  SettingsSection(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Dark mode'),
                            Switch(
                              value: context.watch<ThemeModel>().isDark,
                              thumbColor:
                                  const MaterialStatePropertyAll(Colors.white),
                              trackColor: context.watch<ThemeModel>().isDark
                                  ? const MaterialStatePropertyAll(Colors.blue)
                                  : const MaterialStatePropertyAll(Colors.black),
                              thumbIcon: const MaterialStatePropertyAll<Icon>(
                                Icon(
                                  Icons.dark_mode_rounded,
                                  color: Colors.black87,
                                ),
                              ),
                              onChanged: (value) =>
                                  context.read<ThemeModel>().toggle(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SettingsTitle(
                    icon: FontAwesomeIcons.circleInfo,
                    text: 'About',
                  ),
                  SettingsSection(
                    child: Column(
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap:() async {
                            await launchUrlString(
                              'https://schmeeky.pages.dev',
                              mode: LaunchMode.externalApplication,
                            );
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('About Me'),
                              Icon(
                                FontAwesomeIcons.userAstronaut,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          color: Colors.blueGrey,
                          thickness: 0.3,
                          height: 20,
                          indent: 8,
                          endIndent: 8,
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap:() async {
                            await launchUrlString(
                              'https://schmeeky.pages.dev/posts/recipex',
                              mode: LaunchMode.externalApplication,
                            );
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('About RecipEx'),
                              Icon(
                                FontAwesomeIcons.arrowUpRightFromSquare,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FilledButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      if(!mounted) return;
                      context.read<MiscellaneousProvider>().setHomePageIndex = 0;
                    },
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      fixedSize: const MaterialStatePropertyAll(
                        Size(
                          double.maxFinite,
                          40,
                        ),
                      ),
                    ),
                    child: const Text(
                      'Logout',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.copyright,
                        size: 14,
                        color: Colors.blueGrey,
                      ),
                      SizedBox(width: 3,),
                      Text(
                        'Copyright Abdul Samad Shaikh.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'All rights reserved.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blueGrey,
                    ),
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
