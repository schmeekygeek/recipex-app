import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:recipex_app/controller/page_controller.dart' show LogicController;
import '../classes/user/user.dart';
import '../providers/misc_provider.dart';
import '../service/network/meal_service.dart';
import 'error_dialog.dart';

String _confirmPass = "";
MealServiceImplementation mealService = MealServiceImplementation();
LogicController logicController = LogicController();

showConfirmPassSheet(BuildContext context, User user) {
  showModalBottomSheet(
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
              onPressed: () async {
                if (user.password != _confirmPass) {
                  showErrorDialog(context, "Passwords do not match");
                } else {
                  logicController.signup(context, user);
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
}
