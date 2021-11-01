import 'package:by_trip/shared/theme.dart';
import 'package:by_trip/ui/widgets/custom_bottom_navigation_item.dart';
import 'package:by_trip/ui/widgets/custom_button.dart';
import 'package:by_trip/ui/widgets/destination_card.dart';
import 'package:by_trip/ui/widgets/explore_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

    Widget exploreCard() {
      return ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return ExploreCard();
        },
      );
    }

    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/image_explore.png',
            ),
          ),
        ),
      );
    }

    Widget search() {
      return Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Stack(
                children: [
                  Container(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/main');
                          },
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/icon_back_explore.png',
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Puncak Bogor, Bogor',
                          style: greyTextStyle.copyWith(
                              fontSize: 14, fontWeight: regular),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 70),
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/icon_search.png',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    width: 300,
                    height: 55,
                    decoration: BoxDecoration(
                        color: Color(0xffF0F3FD),
                        border: Border.all(color: Color(0xffDEDEDE)),
                        borderRadius: BorderRadius.circular(defaultRadius)),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          backgroundImage(),
          search(),
          exploreCard(),
          customBottomNavigation(),
        ],
      ),
    );
  }
}
