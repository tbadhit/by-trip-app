import 'package:by_trip/models/models.dart';
import 'package:by_trip/shared/theme.dart';
import 'package:flutter/material.dart';

class ExploreCard extends StatelessWidget {
  const ExploreCard({Key? key, required this.wisata}) : super(key: key);
  final Wisata wisata;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 50),
          width: 270,
          height: 120,
          child: Material(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(defaultRadius),
            elevation: 3,
          ),
        ),
        Positioned(
          bottom: 30,
          left: 25,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(wisata.image!),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60, left: 80),
                    child: Row(
                      children: [
                        Container(
                          width: 15,
                          height: 15,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/icon_star.png'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          '4.5',
                          style: blackTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                wisata.name!,
                style: blackTextStyle.copyWith(
                  fontSize: 15,
                  fontWeight: bold,
                ),
              ),
              Text(
                wisata.city!,
                style: greyTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: medium,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
