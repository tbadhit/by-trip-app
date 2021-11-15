import 'package:by_trip/models/models.dart';
import 'package:by_trip/shared/theme.dart';
import 'package:flutter/material.dart';

class DestinationCard extends StatelessWidget {
  final Wisata wisata;
  final double rating;
  const DestinationCard({
    Key? key,
    required this.wisata,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      rating.toString(),
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
                SizedBox(
                  width: 150,
                  child: Text(
                    wisata.name!,
                    style: blackTextStyle.copyWith(
                        fontSize: 14, fontWeight: semiBold),
                    overflow: TextOverflow.ellipsis,
                  ),
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
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image:
                              AssetImage('assets/icon_place_destination.png'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      wisata.city!,
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
}
