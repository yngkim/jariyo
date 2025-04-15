import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:jariyo/common/layout/default_layout.dart';
import 'package:jariyo/retaurant/model/restaurant_model.dart';
import 'package:jariyo/retaurant/model/searched_restaurant_model.dart';

class SearchedRestaurantCard extends StatelessWidget {
  //식당 썸네일
  // final Widget img;

  final int rid;

  final String rname;

  final String pnumber;

  final String address;

  final String opentime;

  final String closetime;

  final bool isDetail;

  const SearchedRestaurantCard({
    super.key,
    required this.rid,
    required this.rname,
    required this.pnumber,
    required this.address,
    required this.opentime,
    required this.closetime,
    this.isDetail = false,
  });

  factory SearchedRestaurantCard.fromModel({
    required SearchedRestaurantModel model,
    // bool isDetail = false,
  }) {
    return SearchedRestaurantCard(
      rid: model.rid,
      rname: model.rname,
      pnumber: model.pnumber,
      address: model.address,
      opentime: model.opentime,
      closetime: model.closetime,
      // isDetail: isDetail,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isDetail) Image.asset('asset/img/food/ddeok_bok_gi.jpg'),
        if (!isDetail)
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset('asset/img/food/ddeok_bok_gi.jpg'),
          ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                rname,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
