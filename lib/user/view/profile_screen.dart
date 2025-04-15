import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: ProfileScreen(),
  ));
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage:
                  AssetImage('assets/profile_image.jpg'), // 프로필 이미지
            ),
            const SizedBox(height: 16),
            const Column(
              children: [
                Text(
                  'yngkim 님, 반갑습니다',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  '총 예약 횟수 2회',
                  style: TextStyle(color: Colors.black54, fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // 로그아웃 기능 추가
                // 예시로 경고 다이얼로그를 띄웁니다.
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("로그아웃"),
                      content: const Text("로그아웃 하시겠습니까?"),
                      actions: [
                        TextButton(
                          child: const Text("취소"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text("로그아웃"),
                          onPressed: () {
                            // 로그아웃 로직 추가
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                "로그아웃",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
