import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:recipex_app/pages/home.dart';

import '../shared/password_text_form_field.dart';
import '../shared/username_login_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  late final GlobalKey<FormState> _key;

  @override
  void initState() {
    _key = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            LottieBuilder.asset(
              "assets/girl-cooking.json",
              frameRate: FrameRate.max,
              width: 250,
            ),
            const Text(
              "Let's get you onboard.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w100,
                fontFamily: "LobsterTwo",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Sign in",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Staatliches",
                fontSize: 20,
                letterSpacing: 3,
                color: Colors.blueGrey
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            const SizedBox(
              height: 3,
            ),
            Form(
              key: _key,
              child: Column(
                children: const [
                  UsernameTextFormField(),
                  SizedBox(height: 10),
                  PasswordTextFormField(),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Coming soon!"),
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
              ),
              child: const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot password?",
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: "Satoshi",
                    color: Colors.blueGrey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () {
                if (_key.currentState!.validate()) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => const Home(),
                    )
                  );
                }
              },
              style: const ButtonStyle(
                fixedSize: MaterialStatePropertyAll(
                  Size(
                    1000,
                    40
                  ),
                ),
              ),
              child: const Text(
                "LOGIN",
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Coming soon!"),
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "No account? ",
                        style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(
                          fontSize: 13,
                        ),
                      ),
                      TextSpan(
                        text: "Create one!",
                        style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(
                          fontSize: 13, color: Colors.lightBlue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
