import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../extensions.dart';
import '../pages/home.dart';
import '../shared/password_text_form_field.dart';
import '../shared/username_login_text_form_field.dart';

class LoginPage extends StatelessWidget {

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                icon: const Icon(
                  Icons.arrow_back_rounded
                ),
                onPressed: () => context.pop(),
              ),
            ),
            Expanded(
              flex: 2,
              child: LottieBuilder.asset(
                "assets/girl-cooking2.json",
                frameRate: FrameRate.max,
                width: 380,
              ),
            ),
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
            const UsernameTextFormField(),
            const SizedBox(height: 10),
            const PasswordTextFormField(),
            const SizedBox(height: 6),
            GestureDetector(
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Coming soon!"),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
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
                context.pushReplacement(const Home());
              },
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                ),
                fixedSize: const MaterialStatePropertyAll(
                  Size(double.maxFinite, 40),
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
                  onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Coming soon!"),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                      ),
                    ),
                  ),
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
    );
  }
}

// return Scaffold(
   //   body: Padding(
   //     padding: const EdgeInsets.all(12.0),
   //     child: SingleChildScrollView(
   //       child: Column(
   //         crossAxisAlignment: CrossAxisAlignment.center,
   //         mainAxisAlignment: MainAxisAlignment.end,
   //         children: [
   //           Align(
   //             alignment: Alignment.centerLeft,
   //             child: IconButton(
   //               icon: const Icon(
   //                 FontAwesomeIcons.arrowLeftLong,
   //               ),
   //               onPressed: () => context.pop(),
   //             ),
   //           ),
   //           LottieBuilder.asset(
   //             "assets/girl-cooking2.json",
   //             frameRate: FrameRate.max,
   //             width: 230,
   //           ),
   //           const Text(
   //             "Glad to have\nyou back!",
   //             textAlign: TextAlign.center,
   //             style: TextStyle(
   //               fontSize: 40,
   //               fontWeight: FontWeight.w100,
   //               fontFamily: "LobsterTwo",
   //             ),
   //           ),
   //           const SizedBox(
   //             height: 15,
   //           ),
   //           const Text(
   //             "Sign in",
   //             textAlign: TextAlign.center,
   //             style: TextStyle(
   //               fontFamily: "Staatliches",
   //               fontSize: 20,
   //               letterSpacing: 3,
   //               color: Colors.blueGrey,
   //             ),
   //           ),
   //           const SizedBox(height: 16),
   //           const UsernameTextFormField(),
   //           const SizedBox(height: 10),
   //           const PasswordTextFormField(),
   //           const SizedBox(height: 6),
   //           GestureDetector(
   //             onTap: () => ScaffoldMessenger.of(context).showSnackBar(
   //               const SnackBar(
   //                 content: Text("Coming soon!"),
   //                 shape: RoundedRectangleBorder(
   //                   borderRadius: BorderRadius.only(
   //                     topLeft: Radius.circular(5),
   //                     topRight: Radius.circular(5),
   //                   ),
   //                 ),
   //               ),
   //             ),
   //             child: const Align(
   //               alignment: Alignment.centerRight,
   //               child: Text(
   //                 "Forgot password?",
   //                 style: TextStyle(
   //                   fontSize: 13,
   //                   fontFamily: "Satoshi",
   //                   color: Colors.blueGrey,
   //                 ),
   //               ),
   //             ),
   //           ),
   //           const SizedBox(height: 20),
   //           FilledButton(
   //             onPressed: () async {
   //               context.push(const Home());
   //             },
   //             style: ButtonStyle(
   //               shape: MaterialStatePropertyAll(
   //                 RoundedRectangleBorder(
   //                     borderRadius: BorderRadius.circular(4)),
   //               ),
   //               fixedSize: const MaterialStatePropertyAll(
   //                 Size(double.maxFinite, 40),
   //               ),
   //             ),
   //             child: const Text(
   //               "LOGIN",
   //             ),
   //           ),
   //           const SizedBox(height: 20),
   //           Row(
   //             mainAxisAlignment: MainAxisAlignment.center,
   //             children: [
   //               Text(
   //                 "No account? ",
   //                 style: Theme.of(context).textTheme.bodyMedium!.copyWith(
   //                       fontSize: 13,
   //                     ),
   //               ),
   //               GestureDetector(
   //                 onTap: () => ScaffoldMessenger.of(context).showSnackBar(
   //                   const SnackBar(
   //                     content: Text("Coming soon!"),
   //                     shape: RoundedRectangleBorder(
   //                       borderRadius: BorderRadius.only(
   //                         topLeft: Radius.circular(5),
   //                         topRight: Radius.circular(5),
   //                       ),
   //                     ),
   //                   ),
   //                 ),
   //                 child: Text(
   //                   "Create one!",
   //                   style: Theme.of(context).textTheme.bodyMedium!.copyWith(
   //                         fontSize: 13,
   //                         color: Colors.lightBlue,
   //                       ),
   //                 ),
   //               ),
   //             ],
   //           ),
   //         ],
   //       ),
   //     ),
   //   ),
   // );
