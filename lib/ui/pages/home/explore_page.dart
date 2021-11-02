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

    // Widget exploreCard() {
    //   return ListView.builder(
    //     itemCount: 5,
    //     scrollDirection: Axis.horizontal,
    //     itemBuilder: (context, index) {
    //       return ExploreCard();
    //     },
    //   );
    // }

    Widget placeCard() {
      return Container(
        width: 170,
        height: 210,
        margin: EdgeInsets.only(
          left: defaultMargin,
          top: 10,
        ),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: kWhiteColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 140,
              height: 140,
              margin: const EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  image: AssetImage(
                    'assets/image_destination1.png',
                  ),
                ),
              ),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: 54.5,
                  height: 30,
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(18),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        margin: const EdgeInsets.only(right: 2),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/icon_star.png',
                            ),
                          ),
                        ),
                      ),
                      Text(
                        '4.0',
                        style: blackTextStyle.copyWith(
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'jlon',
                    style: blackTextStyle.copyWith(
                        fontSize: 14, fontWeight: semiBold),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 8,
                        height: 13,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                AssetImage('assets/icon_place_destination.png'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        'kcity',
                        style: greyTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: light,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    // Widget card2() {
    //   return Container(
    //     width: 270,
    //     margin: EdgeInsets.only(bottom: 20),
    //     child: Material(
    //       color: Colors.white,
    //       borderRadius: BorderRadius.circular(25),
    //       elevation: 10,
    //       child: Row(
    //         children: [
    //           Container(
    //             width: 90,
    //             height: 90,
    //             margin: EdgeInsets.all(15.0),
    //             decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(10),
    //                 image: DecorationImage(
    //                     image: AssetImage('assets/image_destination2.png'),
    //                     fit: BoxFit.cover)),
    //           ),
    //           Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: <Widget>[
    //               Container(
    //                 width: 150,
    //                 child: Text(
    //                   'Gunung Salak',
    //                   style: blackTextStyle.copyWith(
    //                       fontSize: 16, fontWeight: FontWeight.bold),
    //                   overflow: TextOverflow.ellipsis,
    //                 ),
    //               ),
    //               Container(
    //                 width: 150,
    //                 child: Text(
    //                   'Bogor, Jawa Barat',
    //                   style: greyTextStyle.copyWith(
    //                       fontSize: 12, fontWeight: medium),
    //                   overflow: TextOverflow.ellipsis,
    //                 ),
    //               ),
    //             ],
    //           )
    //         ],
    //       ),
    //     ),
    //   );
    // }

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
          Positioned(
            top: 520,
            child: ExploreCard(
              name: 'Gunung Batu',
              location: 'Bogor',
            ),
          ),
          // Positioned(top: 400, child: placeCard()),
          customBottomNavigation(),
        ],
      ),
    );
  }
}
