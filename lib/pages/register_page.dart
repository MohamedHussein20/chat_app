import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../constants.dart';

String? email;
String? password;

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  GlobalKey<FormState> formKey = GlobalKey();
  static String id = 'RegisterPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Form(
          key: formKey,
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
                onChanged: (data) {
                  email = data;
                },
                hintText: 'E-mail',
              ),
              CustomTextfield(
                onChanged: (data) {
                  password = data;
                },
                hintText: 'Password',
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    try {
                      await RegisterUser();
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        ShowSnackBar(context, 'Weak password');
                      } else if (e.code == 'email-already-in-use') {
                        ShowSnackBar(context, 'Email already exists');
                      }
                    } catch (e) {
                      ShowSnackBar(context, 'There was an error');
                    }
                    ShowSnackBar(context, 'Success');
                  }
                  else{
                    
                  }
                },
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
      ),
    );
  }

  void ShowSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<void> RegisterUser() async {
    UserCredential user =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
