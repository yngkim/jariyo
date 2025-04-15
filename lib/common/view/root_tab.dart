import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jariyo/common/const/colors.dart';
import 'package:jariyo/common/layout/default_layout.dart';
import 'package:jariyo/map/view/map_screen.dart';
import 'package:jariyo/reservation/view/reservation_screen.dart';
import 'package:jariyo/retaurant/view/restaurant_screen.dart';
import 'package:jariyo/search/view/search_screen.dart';
import 'package:jariyo/user/view/profile_screen.dart';

class RootTab extends StatefulWidget {
  const RootTab({super.key});

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> with SingleTickerProviderStateMixin {
  late TabController controller;

  int index = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 5, vsync: this);
    controller.addListener(tabListener);
  }

  void tabListener() {
    setState(() {
      index = controller.index;
    });
  }

  @override
  void dispose() {
    controller.removeListener(tabListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultLayout(
        // title: "숭실대학교",
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: PRIMARY_COLOR,
          selectedFontSize: 10,
          unselectedItemColor: Colors.grey,
          unselectedFontSize: 10,
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            controller.animateTo(index);
          },
          currentIndex: index,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: '홈'),
            BottomNavigationBarItem(
                icon: Icon(Icons.search_outlined), label: '검색'),
            BottomNavigationBarItem(
                icon: Icon(Icons.table_restaurant_outlined), label: '한눈에보기'),
            BottomNavigationBarItem(
                icon: Icon(Icons.receipt_long_outlined), label: '예약 상태'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined), label: '프로필'),
          ],
        ),
        child: TabBarView(
          controller: controller,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            RestaurantScreen(),
            SearchScreen(),
            MapScreen(),
            ReservationScreen(),
            ProfileScreen()
          ],
        ),
      ),
    );
  }
}
