import 'package:by_trip/ui/pages/home/home_page.dart';
import 'package:by_trip/ui/widgets/custom_bottom_navigation_item.dart';
import 'package:by_trip/shared/theme.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget buildContent() {
      return const HomePage();
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomBottomNavigationItem(
                  imageUrl: 'assets/icon_home.png',
                  onTap: () {
                    Navigator.pushNamed(context, '/main');
                  }),
              CustomBottomNavigationItem(
                  imageUrl: 'assets/icon_explore.png',
                  onTap: () {
                    Navigator.pushNamed(context, '/explore');
                  }),
              CustomBottomNavigationItem(
                  imageUrl: 'assets/icon_bookmark.png',
                  onTap: () {
                    Navigator.pushNamed(context, '/bookmark');
                  }),
              CustomBottomNavigationItem(
                  imageUrl: 'assets/icon_profile.png',
                  onTap: () {
                    Navigator.pushNamed(context, '/profile');
                  }),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          buildContent(),
          customBottomNavigation(),
        ],
      ),
    );
  }
}
