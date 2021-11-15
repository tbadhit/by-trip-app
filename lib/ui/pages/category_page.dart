import 'package:by_trip/cubit/cubit.dart';
import 'package:by_trip/cubit/wisata_cubit.dart';
import 'package:by_trip/models/models.dart';
import 'package:by_trip/shared/theme.dart';
import 'package:by_trip/ui/widgets/custom_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'detail_page.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key? key, this.selectedIndex = 0}) : super(key: key);
  int selectedIndex = 0;

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  // var isBookmark = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 30, left: 24, bottom: 20),
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios, color: Colors.black)),
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

    Widget categories() {
      return SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            CustomTabBar(
                selectedIndex: widget.selectedIndex,
                textTapBlack: true,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                titles: const ["Gunung", "Curug", "Pantai", "Camping"],
                onTap: (index) {
                  setState(() {
                    widget.selectedIndex = index;
                  });
                }),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<WisataCubit, WisataState>(
              builder: (_, state) {
                if (state is WisataLoaded) {
                  List<Wisata> listWisata = state.item
                      .where((element) => (widget.selectedIndex == 0)
                          ? element.category == 1
                          : (widget.selectedIndex == 1)
                              ? element.category == 2
                              : (widget.selectedIndex == 2)
                                  ? element.category == 3
                                  : element.category == 4)
                      .toList();

                  return ListView.builder(
                    itemCount: listWisata.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var wisata = listWisata[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailPage(
                                    wisata: wisata,
                                  )));
                        },
                        child: Container(
                          width: double.infinity,
                          height: 300,
                          margin: EdgeInsets.only(
                              left: defaultMargin,
                              right: defaultMargin,
                              top: 10,
                              bottom: 10),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: kWhiteColor,
                          ),
                          child: Material(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 200,
                                  margin: const EdgeInsets.only(bottom: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          wisata.image!,
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                  child: Align(
                                    alignment: Alignment.topRight,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 20,
                                            height: 20,
                                            margin:
                                                const EdgeInsets.only(right: 2),
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/icon_star.png',
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "4.1",
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
                                  margin:
                                      const EdgeInsets.only(top: 10, left: 10),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 230,
                                            child: Text(
                                              wisata.name!,
                                              style: blackTextStyle.copyWith(
                                                  fontSize: 18,
                                                  fontWeight: semiBold),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 2,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 12,
                                                height: 17,
                                                decoration: const BoxDecoration(
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: AssetImage(
                                                        'assets/icon_place_destination.png'),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                wisata.city!,
                                                style: greyTextStyle.copyWith(
                                                  fontSize: 15,
                                                  fontWeight: light,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: loadingIndicator,
                  );
                }
              },
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          children: [title(), categories()],
        ),
      ),
    );
  }
}
