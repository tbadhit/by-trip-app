import 'package:by_trip/cubit/cubit.dart';
import 'package:by_trip/models/models.dart';
import 'package:by_trip/ui/pages/category_page.dart';
import 'package:by_trip/ui/pages/detail_page.dart';
import 'package:by_trip/ui/widgets/custom_tabbar.dart';
import 'package:by_trip/ui/widgets/destination_card.dart';
import 'package:by_trip/ui/widgets/icon_category.dart';
import 'package:flutter/material.dart';
import 'package:by_trip/shared/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  int selectedIndex = 0;

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
                    'Hello ' +
                        (context.read<UserCubit>().state as UserLoaded)
                            .user
                            .name,
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
      return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: CustomTabBar(
            selectedIndex: selectedIndex,
            titles: const ["Semua", "Terkenal", "Rekomendasi"],
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            }),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CategoryPage(selectedIndex: 0)));
                        },
                        name: 'Gunung',
                        imageUrl: 'assets/icon_category1.png'),
                    IconCategory(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CategoryPage(selectedIndex: 2)));
                        },
                        name: 'Pantai',
                        imageUrl: 'assets/icon_category2.png'),
                    IconCategory(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CategoryPage(selectedIndex: 1)));
                        },
                        name: 'Curug',
                        imageUrl: 'assets/icon_category4.png'),
                    IconCategory(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CategoryPage(selectedIndex: 3)));
                        },
                        name: 'Camping',
                        imageUrl: 'assets/icon_category3.png'),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget popularDestinations() {
      return SizedBox(
        width: double.infinity,
        height: 250,
        child: BlocBuilder<WisataCubit, WisataState>(builder: (_, state) {
          if (state is WisataLoaded) {
            List<Wisata> listWisata = state.item;

            return ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Row(
                    children: listWisata
                        .map((wisata) => GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      DetailPage(wisata: wisata)));
                            },
                            child:
                                DestinationCard(wisata: wisata, rating: 4.5)))
                        .toList())
              ],
            );
          } else {
            return Center(
              child: loadingIndicator,
            );
          }
        }),
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
