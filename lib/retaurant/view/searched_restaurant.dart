import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jariyo/common/const/data.dart';
import 'package:jariyo/common/layout/default_layout.dart';
import 'package:jariyo/retaurant/component/retaurant_card.dart';
import 'package:jariyo/retaurant/component/searched_restaurant_card.dart';
import 'package:jariyo/retaurant/model/restaurant_model.dart';
import 'package:jariyo/retaurant/model/searched_restaurant_model.dart';
import 'package:jariyo/retaurant/view/restaurant_detail_screen.dart';
import 'dart:convert';

class SearchedRestaurant extends StatefulWidget {
  final String searchedKeyword;
  const SearchedRestaurant({super.key, required this.searchedKeyword});

  @override
  State<SearchedRestaurant> createState() => _SearchedRestaurantState();
}

class _SearchedRestaurantState extends State<SearchedRestaurant> {
  Future<List> paginateRestaurant() async {
    final dio = Dio();
    // restaurant는 authorization이 필수요소이기 때문에 storage에서 token 가져옴
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    try {
      final resp = await dio.get(
        'http://localhost:8080/api/restaurant/rname/${widget.searchedKeyword}',
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
          },
        ),
      );
      // print(resp.data);
      print(resp.data);
      return resp.data;
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: FutureBuilder<List>(
          future: paginateRestaurant(),
          builder: (context, AsyncSnapshot<List> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("error"),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text("No data available"),
              );
            }

            return DefaultLayout(
              // title: "숭실대학교",
              child: ListView.separated(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) {
                  final item = snapshot.data![index];
                  final pItem = SearchedRestaurantModel.fromJson(json: item);
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const RestaurantDetailScreen()));
                    },
                    child: SearchedRestaurantCard.fromModel(
                      model: pItem,
                    ),
                  );
                },
                separatorBuilder: (_, index) {
                  return const SizedBox(
                    height: 16,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
