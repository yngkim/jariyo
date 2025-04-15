import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jariyo/common/layout/default_layout.dart';
import 'package:jariyo/user/view/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    wait();
  }

  //그냥 심심해서 넣은것.
  void wait() async {
    await Future.delayed(const Duration(seconds: 1));
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const LoginScreen()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/img/logo/logo.png',
              width: MediaQuery.of(context).size.width / 3 * 2,
            ),
            const SizedBox(
              height: 150,
            ),
            const CircularProgressIndicator(
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
