import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:jariyo/common/component/custom_text_form_field.dart';
import 'package:jariyo/common/const/colors.dart';
import 'package:jariyo/common/const/data.dart';
import 'package:jariyo/common/layout/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:jariyo/common/view/root_tab.dart';
import 'package:jariyo/common/view/splash_screen.dart';
import 'package:jariyo/map/view/map_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String username = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    return DefaultLayout(
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 32,
                ),
                const _Title(),
                const SizedBox(
                  height: 16,
                ),
                Image.asset(
                  'asset/img/logo/logo2.png',
                  width: MediaQuery.of(context).size.width / 3 * 1,
                ),
                CustomTextFormField(
                  hintText: '이메일을 입력해 주세요',
                  onChanged: (String value) {
                    username = value;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTextFormField(
                  hintText: '비밀번호를 입력해 주세요',
                  obscureText: true,
                  onChanged: (String value) {
                    password = value;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final rawString = '$username:$password';

                    Codec<String, String> StringToBase64 = utf8.fuse(base64);

                    String token = StringToBase64.encode(rawString);

                    final data = {'email': username, 'password': password};

                    final resp = await dio.post(
                      'http://localhost:8080/login',
                      data: data,
                      // options: Options(
                      //   headers: {
                      //     "email": username,
                      //     "password": password,
                      //   },
                      // ),
                    );

                    final refreshToken =
                        resp.headers.value('Authorization-refresh');
                    final accessToken = resp.headers.value('Authorization');

                    await storage.write(
                        key: REFRESH_TOKEN_KEY, value: refreshToken);
                    await storage.write(
                        key: ACCESS_TOKEN_KEY, value: accessToken);
                    // WidgetsFlutterBinding.ensureInitialized();
                    // await NaverMapSdk.instance.initialize();
                    initializeMap();

                    //로그인에 성공하면 rootPage로 이동
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const RootTab(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: PRIMARY_COLOR,
                  ),
                  child: const Text(
                    '로그인',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                    ),
                    child: const Text('회원가입')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      '환영합니다!',
      style: TextStyle(
          fontSize: 34, fontWeight: FontWeight.w700, color: Color(0xFF5e5e5e)),
    );
  }
}
