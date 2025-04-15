import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:jariyo/common/const/colors.dart';
import 'package:jariyo/common/layout/default_layout.dart';
import 'package:jariyo/retaurant/model/restaurant_model.dart';

class RestaurantCard extends StatelessWidget {
  //식당 썸네일
  // final Widget img;

  final int rid;

  final String rname;

  final String pnumber;

  final String address;

  final String opentime;

  final String closetime;

  final bool isDetail;

  const RestaurantCard({
    super.key,
    required this.rid,
    required this.rname,
    required this.pnumber,
    required this.address,
    required this.opentime,
    required this.closetime,
    this.isDetail = false,
  });

  factory RestaurantCard.fromModel({
    required RestaurantModel model,
    // bool isDetail = false,
  }) {
    return RestaurantCard(
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
        if (rname == "젠사이야" && !isDetail)
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset('asset/img/food/zen.png'),
          ),
        if (rname == "추억과 김밥" && !isDetail)
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset('asset/img/food/gimbab.png'),
          ),
        if (rname == "젠사이야" && isDetail) Image.asset('asset/img/food/zen.png'),
        if (rname == "추억과 김밥" && isDetail)
          Image.asset('asset/img/food/gimbab.png'),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Text(
                    rname,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  if (rname == "젠사이야")
                    const SizedBox(
                      width: 180,
                    ),
                  if (rname == '추억과 김밥')
                    const SizedBox(
                      width: 155,
                    ),
                  if (rname == '젠사이야')
                    const Text(
                      "26/50",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: Colors.orange),
                    ),
                  if (rname == '추억과 김밥')
                    const Text(
                      "13/60",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: Colors.lightGreen),
                    ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              if (rname == '젠사이야') const Text('숭실대 1등 이자카야'),
              if (rname == '추억과 김밥') const Text('분식 맛집'),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (rname == "추억과 김밥")
                    const Text(
                      '분식 · 김밥 · 라면 · 떡볶이 ',
                      style: TextStyle(
                          color: PRIMARY_COLOR,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  if (rname == "젠사이야")
                    const Text(
                      '이자카야 · 오코노미야키 · 챵코나베',
                      style: TextStyle(
                          color: PRIMARY_COLOR,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
