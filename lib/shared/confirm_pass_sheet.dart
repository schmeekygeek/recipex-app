import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../extensions.dart';
import '../providers/misc_provider.dart';
import '../service/network/meal_service.dart';

MealServiceImplementation mealService = MealServiceImplementation();

confirmPassword(
  BuildContext context,
  String password
) async {
  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: false,
    enableDrag: true,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          left: 12,
          right: 12,
          top: 12,
          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 7,
              ),
              child: GestureDetector(
                onTap: () {
                  context.read<MiscellaneousProvider>().setPassword('');
                  context.pop();
                },
                child: const Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    FontAwesomeIcons.xmark,
                    size: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Confirm\npassword',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontFamily: 'Cabinet',
                      letterSpacing: 0,
                      fontSize: 30,
                    ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              autofillHints: const [
                AutofillHints.password,
              ],
              keyboardType: TextInputType.visiblePassword,
              onChanged: (value) => context.read<MiscellaneousProvider>().setPassword(value),
              obscureText:
                  context.watch<MiscellaneousProvider>().getIsPasswordVisible,
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(
                    right: 15,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      context
                          .read<MiscellaneousProvider>()
                          .togglePasswordVisibility();
                    },
                    child: Icon(
                      !context
                              .watch<MiscellaneousProvider>()
                              .getIsPasswordVisible
                          ? FontAwesomeIcons.solidEyeSlash
                          : FontAwesomeIcons.solidEye,
                      size: 19,
                    ),
                  ),
                ),
                hintText: 'Password',
                filled: true,
              ),
              style: Theme.of(context).textTheme.bodyMedium,
              validator: (value) {
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            FilledButton(
              onPressed: () => context.pop(),
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
                'Done',
              ),
            ),
          ],
        ),
      );
    },
  );
}
