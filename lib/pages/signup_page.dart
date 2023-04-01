import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:recipex_app/extensions.dart';
import 'package:recipex_app/pages/login_page.dart';
import 'package:recipex_app/shared/input_fields/name_text_form_field.dart';

import '../shared/input_fields/password_text_form_field.dart';
import '../shared/input_fields/username_login_text_form_field.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_rounded),
                  onPressed: () => context.pop(),
                ),
              ),
              Expanded(
                flex: 2,
                child: LottieBuilder.asset(
                  "assets/login-girl-cooking.json",
                  frameRate: FrameRate.max,
                  width: 380,
                ),
              ),
              const Text(
                "Let's get you on board!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w100,
                  fontFamily: "LobsterTwo",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Sign up",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Staatliches",
                  fontSize: 20,
                  letterSpacing: 3,
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: 16),
              const NameTextFormField(),
              const SizedBox(height: 10),
              const UsernameTextFormField(),
              const SizedBox(height: 10),
              const PasswordTextFormField(),
              const SizedBox(height: 20),
              FilledButton(
                onPressed: () {
                  context.pop();
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
                  "Sign up",
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already registered? ",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 13,
                        ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.pop();
                      context.push(const LoginPage());
                    },
                    child: Text(
                      "Sign in",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 13,
                            color: Colors.lightBlue,
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
