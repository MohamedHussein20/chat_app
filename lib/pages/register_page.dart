import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  static String id = 'RegisterPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 75,
            ),
            Image.asset(
              'assets/images/scholar.png',
              height: 100,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Quick Chat',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontFamily: 'pacifico',
                  ),
                ),
                SizedBox(
                  height: 75,
                ),
              ],
            ),
            const Row(
              children: [
                Text(
                  'REGISTER',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            CustomTextfield(
              hintText: 'E-mail',
            ),
            CustomTextfield(
              hintText: 'Password',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              title: 'Register',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account ? ",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    " Login",
                    style: TextStyle(
                      color: Color(0xffC4E9E7),
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
