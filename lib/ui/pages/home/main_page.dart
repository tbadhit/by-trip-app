import 'dart:async';

import 'package:by_trip/ui/pages/home/bookmark_page.dart';
import 'package:by_trip/ui/pages/category_page.dart';
import 'package:by_trip/ui/pages/home/explore_page.dart';
import 'package:by_trip/ui/pages/home/home_page.dart';
import 'package:by_trip/ui/pages/home/profile_page.dart';
import 'package:by_trip/ui/widgets/custom_bottom_navigation_item.dart';
import 'package:by_trip/shared/theme.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  final int initialPage;
  const MainPage({Key? key, this.initialPage = 0}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    selectedPage = widget.initialPage;
    pageController = PageController(initialPage: widget.initialPage);
  }

  @override
  Widget build(BuildContext context) {
    Widget buildContent() {
      return SafeArea(
          child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            selectedPage = index;
          });
        },
        children: const [
          Center(
            child: HomePage(),
          ),
          Center(
            child: ExplorePage(),
          ),
          Center(
            child: BookmarkPage(),
          ),
          Center(
            child: ProfilePage(),
          )
        ],
      ));
    }

    Widget customBottomNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            width: double.infinity,
            height: 60,
            margin: EdgeInsets.only(
              bottom: 30,
              left: defaultMargin,
              right: defaultMargin,
            ),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: CustomBottomNavigationItem(
                selectedIndex: selectedPage,
                onTap: (index) {
                  setState(() {
                    selectedPage = index;
                  });
                  pageController.jumpToPage(selectedPage);
                })),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          SafeArea(
              child: Container(
            color: Colors.white,
          )),
          buildContent(),
          customBottomNavigation(),
        ],
      ),
    );
  }
}
