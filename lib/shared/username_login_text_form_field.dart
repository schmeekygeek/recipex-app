import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:recipex_app/providers/misc_provider.dart';

import '../util/constants.dart';


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
      decoration: InputDecoration(
        suffixIcon: const Padding(
          padding: EdgeInsets.only(
            right: 15,
          ),
          child: Icon(
            FontAwesomeIcons.solidUser,
            size: 19,
          ),
        ),
        fillColor: Colors.black.withOpacity(0.1),
        contentPadding: Theme.of(context).inputDecorationTheme.contentPadding,
        hintText: "Username",
        hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
        border: Theme.of(context).inputDecorationTheme.border,
        focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
        errorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
        focusedErrorBorder:
            Theme.of(context).inputDecorationTheme.focusedErrorBorder,
        errorStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 16,
              letterSpacing: 1,
              height: 0.9,
              color: Colors.redAccent,
              fontWeight: FontWeight.w600,
            ),
        filled: true,
      ),
      style: Theme.of(context).textTheme.bodyMedium,
      obscureText: false,
      validator: (value) {
        if (Constants.validUsernameRegex.hasMatch(value!)) {
          return null;
        } else if (value.isEmpty) {
          return "Required field";
        }
        return "Invalid username";
      },
    );
  }
}
