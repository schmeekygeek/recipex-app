import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: Text(
              "DASHBOARD",
              style: Theme.of(context).appBarTheme.toolbarTextStyle,
            ),
          ),
          const SliverToBoxAdapter(

          ),
        ],
      ),
    );
  }
}
