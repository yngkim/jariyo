import 'package:flutter/material.dart';
import 'package:jariyo/common/const/colors.dart';

class DefaultLayout extends StatelessWidget {
  final Widget child;
  final String? title;
  final Widget? bottomNavigationBar;
  final Color? backgrounfColor;
  const DefaultLayout({
    super.key,
    required this.child,
    this.title,
    this.bottomNavigationBar,
    this.backgrounfColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBar(),
      bottomNavigationBar: bottomNavigationBar,
      backgroundColor: Colors.white,
      body: child,
    );
  }

  AppBar? renderAppBar() {
    if (title == null) {
      return null;
    } else {
      return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: backgrounfColor ?? Colors.white,
        elevation: 0,
        title: Row(
            // mainAxisAlignment: ,
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 19,
                weight: 900,
                color: PRIMARY_COLOR,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                title!,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ]),
        // actions: <Widget>[
        //   IconButton(
        //       icon: const Icon(Icons.search),
        //       onPressed: () {
        //         Navigator.of(context).push(
        //             MaterialPageRoute(builder: (_) => const SearchScreen()));
        //       }),
        // ],
      );
    }
  }
}
