import 'package:chat_app/constants.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
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
                  'SIGN IN',
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
              title: 'Login',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "don't have an account ? ",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RegisterPage.id);
                  },
                  child: const Text(
                    " Register",
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
