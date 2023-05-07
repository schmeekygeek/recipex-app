import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/theme_model.dart';

class SettingsSection extends StatelessWidget {
  final Widget child;
  const SettingsSection({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: context.watch<ThemeModel>().isDark ? Dark.base : White.base,
      ),
      child: child,
    );
  }
}
