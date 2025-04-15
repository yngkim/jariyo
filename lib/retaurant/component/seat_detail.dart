import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jariyo/common/const/colors.dart';
import 'package:jariyo/retaurant/component/box_grid_screen.dart';

class SeatDetail extends StatelessWidget {
  const SeatDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(children: [
        Container(
          height: 7,
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 204, 204, 204)),
          child: const Center(
            child: Text(''),
          ),
        ),
        const Padding(
            padding: EdgeInsets.only(left: 50), child: BoxGridScreen()),
        Padding(
            padding: const EdgeInsets.only(top: 100),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.05,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  backgroundColor: PRIMARY_COLOR,
                ),
                child: const Text(
                  '예약하기',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            )),
      ]),
    );
  }
}
