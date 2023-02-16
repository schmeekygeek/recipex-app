import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../providers/meal_list_provider.dart';
import '../providers/misc_provider.dart';
import '../util/constants.dart';

class PasswordTextFormField extends StatelessWidget {
  const PasswordTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofillHints: const [
        AutofillHints.password,
      ],
      keyboardType: TextInputType.visiblePassword,
      onChanged: (value) => context.read<MiscellaneousProvider>().setPassword = value,
      obscureText: context.watch<MealListProvider>().getIsPasswordVisible,
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: const EdgeInsets.only(
            right: 15,
          ),
          child: GestureDetector(
            onTap: () =>
                context.read<MealListProvider>().togglePasswordVisibility(),
            child: Icon(
              !context.watch<MealListProvider>().getIsPasswordVisible
                  ? FontAwesomeIcons.solidEyeSlash
                  : FontAwesomeIcons.solidEye,
              size: 19,
            ),
          ),
        ),
        fillColor: Colors.black.withOpacity(0.1),
        contentPadding: Theme.of(context).inputDecorationTheme.contentPadding,
        hintText: "Password",
        hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
        border: Theme.of(context).inputDecorationTheme.border,
        focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
        errorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
        focusedErrorBorder:
            Theme.of(context).inputDecorationTheme.focusedErrorBorder,
        errorStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 16,
              letterSpacing: 1,
              color: Colors.redAccent,
              fontWeight: FontWeight.w600,
              height: 0.9,
            ),
        filled: true,
      ),
      style: Theme.of(context).textTheme.bodyMedium,
      validator: (value) {
        if (Constants.validPasswordRegex.hasMatch(value!)) {
          return null;
        } else if (value.isEmpty) {
          return "Required field";
        }
        return "Invalid password";
      },
    );
  }
}
