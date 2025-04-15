import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoxGridScreen extends StatelessWidget {
  const BoxGridScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
        ),
        child: Stack(
          children: [
            // Base grid to visualize the positions (optional)
            CustomPaint(
              painter: GridPainter(),
              child:
                  Container(), // Make sure CustomPaint has a child to define its size
            ),
            // Small boxes positioned at (2, 2), (3, 3), and (2, 3)
            const PositionedBox(
                x: 0, y: 1, isOccupied: true, isReservated: false),
            const PositionedBox(
                x: 2, y: 1, isOccupied: false, isReservated: false),
            const PositionedBox(
                x: 4, y: 1, isOccupied: true, isReservated: false),
            const PositionedBox(
                x: 0, y: 3, isOccupied: false, isReservated: false),
            const PositionedBox(
                x: 2, y: 3, isOccupied: true, isReservated: false),
            const PositionedBox(
                x: 4, y: 3, isOccupied: false, isReservated: false),
            const PositionedBox(
                x: 0, y: 5, isOccupied: true, isReservated: false),
            const PositionedBox(
                x: 4, y: 5, isOccupied: false, isReservated: false),
          ],
        ),
      ),
    );
  }
}

class PositionedBox extends StatelessWidget {
  final double x;
  final double y;
  final bool isOccupied;
  final bool isReservated;

  const PositionedBox({
    Key? key,
    required this.x,
    required this.y,
    required this.isOccupied,
    required this.isReservated,
  }) : super(key: key);

  void _showReservationDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text("예약 확인"),
          content: const Text("3번 테이블을 예약할까요?\n최대 인원: 5"),
          actions: <Widget>[
            CupertinoDialogAction(
              child: const Text(
                "취소",
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: const Text(
                "예약하기",
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                _showReservationConfirmedDialog(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _showReservationConfirmedDialog(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text(
            "예약되었습니다",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              child: const Text(
                "확인",
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: x * 50, // Adjust these values based on your grid scaling
      top: y * 50, // Adjust these values based on your grid scaling
      child: GestureDetector(
        onTap: () {
          if (!isOccupied) {
            _showReservationDialog(context);
          }
        },
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: isOccupied ? Colors.red : Colors.white,
            border: Border.all(
              color: isOccupied ? Colors.transparent : Colors.grey,
            ),
            borderRadius: BorderRadius.circular(8), // 둥근 모서리 설정
          ),
        ),
      ),
    );
  }
}

class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1.0;

    // Draw horizontal lines
    for (int i = 0; i <= 6; i++) {
      canvas.drawLine(Offset(0, i * 50), Offset(size.width, i * 50), paint);
    }

    // Draw vertical lines
    for (int i = 0; i <= 6; i++) {
      canvas.drawLine(Offset(i * 50, 0), Offset(i * 50, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
