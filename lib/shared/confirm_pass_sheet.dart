import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../extensions.dart';
import '../providers/misc_provider.dart';
import '../service/network/meal_service.dart';

String _confirmPass = "";
late bool confirmed;
MealServiceImplementation mealService = MealServiceImplementation();

Future<bool> confirmPassword(BuildContext context, String password) async {
  await showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: true,
    enableDrag: true,
    constraints: BoxConstraints.tight(
      const Size(
        double.infinity,
        260,
      ),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Confirm\npassword",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontFamily: "Supreme",
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
              onChanged: (value) => _confirmPass = value,
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
                hintText: "Password",
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
              onPressed: () {
                if (password != _confirmPass) {
                  confirmed = false;
                } else {
                  confirmed = true;
                }
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
                "Done",
              ),
            ),
          ],
        ),
      );
    },
  );
  return confirmed;
}
