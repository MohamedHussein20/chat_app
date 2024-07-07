import 'package:chat_app/constants.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  static String id = "SplashPage";

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          const SizedBox(
            height: 150,
          ),
          Center(
            child: Image.asset(kLogo),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Quick Chat',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontFamily: 'pacifico',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text(
              "Developed By Mohamed Hussein",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  fontSize: 15),
            ),
          )
        ],
      ),
      nextScreen: const LoginPage(),
      splashIconSize: 500,
      backgroundColor: const Color(0xff23272E),
    );
  }
}
