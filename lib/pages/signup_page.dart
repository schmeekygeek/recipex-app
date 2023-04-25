import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../classes/exceptions/app_exceptions.dart';
import '../shared/error_dialog.dart';
import '../util/validator.dart';
import '../service/network/meal_service.dart';
import '../shared/confirm_pass_sheet.dart';
import '../extensions.dart';
import '../providers/misc_provider.dart';
import 'login_page.dart';

String _name = '';
String _username = '';
String _email = '';
String _password = '';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  static MealServiceImplementation mealService = MealServiceImplementation();

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
              Expanded(
                child: Image.asset(
                  'assets/munchies.png',
                  height: 200,
                  width: 200,
                ),
              ),
              const Text(
                "Let's get you on board!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w100,
                  fontFamily: 'LobsterTwo',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Sign up',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Staatliches',
                  fontSize: 20,
                  letterSpacing: 3,
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                autofillHints: const [
                  AutofillHints.name,
                ],
                keyboardType: TextInputType.name,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                onChanged: (value) => _name = value,
                decoration: const InputDecoration(
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(
                      right: 15,
                    ),
                    child: Icon(
                      FontAwesomeIcons.font,
                      size: 19,
                    ),
                  ),
                  hintText: 'Name',
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
                  AutofillHints.email,
                ],
                keyboardType: TextInputType.emailAddress,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                onChanged: (value) => _email = value,
                decoration: const InputDecoration(
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(
                      right: 15,
                    ),
                    child: Icon(
                      FontAwesomeIcons.solidEnvelope,
                      size: 19,
                    ),
                  ),
                  hintText: 'Email',
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
                  hintText: 'Username',
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
              const SizedBox(height: 20),
              FilledButton(
                onPressed: () async {
                  context.read<MiscellaneousProvider>().setPassword('');
                  try {
                    Validator.validateName(_name);
                    Validator.validateEmail(_email);
                    Validator.validateUsername(_username);
                    Validator.validatePassword(_password);
                    await confirmPassword(
                      context,
                      _password,
                    );
                    if(!mounted) return;
                    String confirmedPass = context.read<MiscellaneousProvider>().getPassword;
                    if(confirmedPass.isEmpty) {
                      showErrorDialog(context, 'A password is needed');
                      return;
                    }
                    else if(confirmedPass != _password) {
                      showErrorDialog(context, 'The passwords do not match');
                      context.read<MiscellaneousProvider>().setPassword('');
                      return;
                    }
                    print('The password is correctly entered');
                  } on InvalidNameException {
                    showErrorDialog(
                      context,
                      'Invalid name',
                    );
                  } on InvalidPasswordException {
                    showErrorDialog(
                      context,
                      '8 characters for password',
                    );
                  } on InvalidEmailException {
                    showErrorDialog(
                      context,
                      'Invalid email',
                    );
                  } on InvalidUsernameException {
                    showErrorDialog(
                      context,
                      'Invalid username',
                    );
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
                  'Sign up',
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already registered? ',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 13,
                        ),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.pushReplacement(const LoginPage());
                    },
                    child: Text(
                      'Sign in',
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
