import 'package:flutter/material.dart';
import 'package:jariyo/common/view/splash_screen.dart';
import 'package:jariyo/map/view/map_screen.dart';
import 'package:jariyo/user/view/login_screen.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

void main() async {
  //카카오 로그인용
  // KakaoSdk.init(nativeAppKey: '$YOUR_NATIVE_APP_KEY');
  runApp(const _App());
}

class _App extends StatelessWidget {
  const _App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'NotoSans',
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      // home: const LoginScreen(),
    );
  }
}
