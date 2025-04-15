import 'package:flutter/material.dart';
import 'package:jariyo/common/layout/default_layout.dart';
import 'package:jariyo/retaurant/component/retaurant_card.dart';
import 'package:jariyo/retaurant/component/seat_detail.dart';

class RestaurantDetailScreen extends StatelessWidget {
  const RestaurantDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
      // title: '',
      child: Column(
        children: [
          RestaurantCard(
            rid: 1,
            rname: "젠사이야",
            pnumber: "1234",
            address: "상도동",
            opentime: "0900",
            closetime: "2100",
            isDetail: true,
          ),
          SeatDetail(),
        ],
      ),
    );
  }
}
