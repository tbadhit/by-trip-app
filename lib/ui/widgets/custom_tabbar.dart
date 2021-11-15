import 'package:by_trip/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final int selectedIndex;
  final List<String> titles;
  final Function(int)? onTap;
  final bool textTapBlack;
  final MainAxisAlignment mainAxisAlignment;

  const CustomTabBar(
      {required this.selectedIndex,
      required this.titles,
      required this.onTap,
      this.textTapBlack = false,
      this.mainAxisAlignment = MainAxisAlignment.start});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: titles
          .map((e) => Padding(
                padding: EdgeInsets.only(
                    left: (e == titles.first) ? 30 : 0, right: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                        onTap: () {
                          if (onTap != null) {
                            onTap!(titles.indexOf(e));
                          }
                        },
                        child: (textTapBlack == true)
                            ? Text(
                                e,
                                style: (titles.indexOf(e) == selectedIndex)
                                    ? blackTextStyle.copyWith(
                                        fontSize: 12, fontWeight: semiBold)
                                    : greyTextStyle.copyWith(
                                        fontSize: 12, fontWeight: semiBold),
                              )
                            : Text(
                                e,
                                style: (titles.indexOf(e) == selectedIndex)
                                    ? blackTextStyle.copyWith(
                                        fontSize: 12, fontWeight: semiBold)
                                    : greyTextStyle.copyWith(
                                        fontSize: 12, fontWeight: semiBold),
                              )),
                  ],
                ),
              ))
          .toList(),
    );
  }
}
