import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../providers/misc_provider.dart';

class UsernameTextFormField extends StatelessWidget {
  const UsernameTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofillHints: const [
        AutofillHints.username,
      ],
      keyboardType: TextInputType.name,
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      onChanged: (value) => context.read<MiscellaneousProvider>().setUsername = value,
      decoration: const InputDecoration(
        suffixIcon: Padding(
          padding: EdgeInsets.only(
            right: 15,
          ),
          child: Icon(
            FontAwesomeIcons.solidUser,
            size: 19,
          ),
        ),
        hintText: "Username",
      ),
      style: Theme.of(context).textTheme.bodyMedium,
      obscureText: false,
      validator: (value) {
        return null;
      },
    );
  }
}