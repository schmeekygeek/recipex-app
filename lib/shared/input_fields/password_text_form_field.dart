import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../providers/misc_provider.dart';

class PasswordTextFormField extends StatelessWidget {
  const PasswordTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofillHints: const [
        AutofillHints.password,
      ],
      keyboardType: TextInputType.visiblePassword,
      onChanged: (value) {
        context.read<MiscellaneousProvider>().setPassword = value;
      },
      obscureText: context.watch<MiscellaneousProvider>().getIsPasswordVisible,
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: const EdgeInsets.only(
            right: 15,
          ),
          child: GestureDetector(
            onTap: () {
              context.read<MiscellaneousProvider>().togglePasswordVisibility();
            },
            child: Icon(
              !context.watch<MiscellaneousProvider>().getIsPasswordVisible
              ? FontAwesomeIcons.solidEyeSlash
              : FontAwesomeIcons.solidEye,
              size: 19,
            ),
          ),
        ),
        hintText: "Password",
        filled: true,
      ),
      style: Theme.of(context).textTheme.bodyMedium,
      validator: (value) {
        return null;
      }
    );
  }
}
