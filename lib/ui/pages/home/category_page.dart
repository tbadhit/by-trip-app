import 'package:by_trip/shared/theme.dart';
import 'package:by_trip/ui/widgets/custom_bottom_navigation_item.dart';
import 'package:by_trip/ui/widgets/custom_button.dart';
import 'package:by_trip/ui/widgets/custom_text_form_field.dart';
import 'package:by_trip/ui/widgets/destination_card.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 30, left: 24, bottom: 10),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/main');
              },
              child: Container(
                width: 33,
                height: 33,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/icon_back.png',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              'Kategori',
              style: blackTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
          ],
        ),
      );
    }

    Widget popularDestinations() {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            width: 170,
            height: 215,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: kWhiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/image_bookmark1.png',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Gunung Leutik',
                  style: blackTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                      'Jawa Barat',
                      style: greyTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: regular,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget categories() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                'Gunung',
                style: yellowTextStyle.copyWith(
                    fontSize: 14, fontWeight: semiBold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 15),
              child: Text(
                'Pantai',
                style:
                    greyTextStyle.copyWith(fontSize: 14, fontWeight: semiBold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 15),
              child: Text(
                'Camping',
                style:
                    greyTextStyle.copyWith(fontSize: 14, fontWeight: semiBold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 15),
              child: Text(
                'Curug',
                style:
                    greyTextStyle.copyWith(fontSize: 14, fontWeight: semiBold),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          children: [title(), categories(), popularDestinations()],
        ),
      ),
    );
  }
}
