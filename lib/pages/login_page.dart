import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import 'signup_page.dart';
import '../extensions.dart';
import '../pages/home.dart';
import '../providers/misc_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static late String password;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  late String _username;
  late String _password;

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
              // Expanded(
              //   flex: 2,
              //   child: LottieBuilder.asset(
              //     "assets/login-girl-cooking.json",
              //     frameRate: FrameRate.max,
              //     width: 380,
              //   ),
              // ),
              const Text(
                "Glad to have you back!",
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
                "Sign in",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Staatliches",
                  fontSize: 20,
                  letterSpacing: 3,
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                autofillHints: const [
                  AutofillHints.username,
                ],
                keyboardType: TextInputType.name,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                onChanged: (value) => _username = value,
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
              ),
              const SizedBox(height: 10),
              TextFormField(
                  autofillHints: const [
                    AutofillHints.password,
                  ],
                  keyboardType: TextInputType.visiblePassword,
                  onChanged: (value) => _password = value,
                  obscureText: context
                      .watch<MiscellaneousProvider>()
                      .getIsPasswordVisible,
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
                  }),
              const SizedBox(height: 6),
              GestureDetector(
                onTap: () => {},
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
                  context.pop();
                  context.pushReplacement(const Home());
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
                  "LOGIN",
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "No account? ",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 13,
                        ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.pop();
                      context.push(const SignUp());
                    },
                    child: Text(
                      "Create one!",
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
