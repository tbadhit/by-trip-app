import 'package:by_trip/ui/widgets/destination_card.dart';
import 'package:by_trip/ui/widgets/icon_category.dart';
import 'package:flutter/material.dart';
import 'package:by_trip/shared/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller = PageController();
  List carousels = [
    "assets/carousel1.png",
    "assets/carousel2.png",
    "assets/carousel3.png"
  ];

  final List<String> listImages = [
    'assets/carousel1.png',
    'assets/carousel2.png',
    'assets/carousel3.png',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 35,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello Muflikhan!',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Mau liburan kemana?',
                    style: greyTextStyle.copyWith(
                      fontWeight: light,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    'assets/image_profile.png',
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget categories() {
      return Row(
        children: [
          SizedBox(
            width: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              'Semua',
              style:
                  blackTextStyle.copyWith(fontSize: 12, fontWeight: semiBold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 15),
            child: Text(
              'Terkenal',
              style: greyTextStyle.copyWith(fontSize: 12, fontWeight: semiBold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 15),
            child: Text(
              'Rekomendasi',
              style: greyTextStyle.copyWith(fontSize: 12, fontWeight: semiBold),
            ),
          ),
        ],
      );
    }

    Widget title() {
      return Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 20),
            child: Text(
              'Explore Wisata',
              style: blackTextStyle.copyWith(fontSize: 14, fontWeight: bold),
            ),
          ),
        ],
      );
    }

    Widget titleCategory() {
      return Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 30, bottom: 10),
            child: Text(
              'Kategori',
              style: blackTextStyle.copyWith(fontSize: 14, fontWeight: bold),
            ),
          ),
        ],
      );
    }

    Widget iconCategory() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 10,
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 120),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconCategory(
                        onTap: () {
                          Navigator.pushNamed(context, '/category');
                        },
                        name: 'Gunung',
                        imageUrl: 'assets/icon_category1.png'),
                    IconCategory(
                        onTap: () {
                          Navigator.pushNamed(context, '/category');
                        },
                        name: 'Pantai',
                        imageUrl: 'assets/icon_category2.png'),
                    IconCategory(
                        onTap: () {
                          Navigator.pushNamed(context, '/category');
                        },
                        name: 'Camping',
                        imageUrl: 'assets/icon_category3.png'),
                    IconCategory(
                        onTap: () {
                          Navigator.pushNamed(context, '/category');
                        },
                        name: 'Curug',
                        imageUrl: 'assets/icon_category4.png'),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget popularDestinations() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: [
              DestinationCard(
                name: 'Gunung Bromo',
                city: 'Pasuruan',
                imageUrl: 'assets/image_reccomend1.png',
                onTap: () {
                  Navigator.pushNamed(context, '/detail');
                },
                rating: 4.5,
              ),
              DestinationCard(
                name: 'Gunung Semeru',
                city: 'Malang',
                imageUrl: 'assets/image_reccomend2.png',
                onTap: () {
                  Navigator.pushNamed(context, '/edit-profile');
                },
                rating: 4.5,
              ),
              DestinationCard(
                name: 'Gunung Bromo',
                city: 'Pasuruan',
                imageUrl: 'assets/image_reccomend1.png',
                onTap: () {
                  Navigator.pushNamed(context, '/login');
                },
                rating: 3.5,
              ),
            ],
          ),
        ),
      );
    }

    Widget carouselSlider() {
      return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: CarouselSlider(
          options: CarouselOptions(
            reverse: true,
            autoPlay: true,
            viewportFraction: 1.0,
            height: 180.0,
          ),
          items: carousels.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Image.asset(i);
              },
            );
          }).toList(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          header(),
          carouselSlider(),
          title(),
          categories(),
          popularDestinations(),
          titleCategory(),
          iconCategory()
        ],
      ),
    );
  }
}
