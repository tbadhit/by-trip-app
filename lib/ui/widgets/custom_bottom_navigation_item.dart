import 'package:flutter/material.dart';

class CustomBottomNavigationItem extends StatelessWidget {
  final int selectedIndex;
  final Function(int index)? onTap;

  const CustomBottomNavigationItem({
    Key? key,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            if (onTap != null) {
              onTap!(0);
            }
          },
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/icon_home' +
                      ((selectedIndex == 0 ? "_choose.png" : ".png")),
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (onTap != null) {
              onTap!(1);
            }
          },
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/icon_explore' +
                      ((selectedIndex == 1 ? "_choose.png" : ".png")),
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (onTap != null) {
              onTap!(2);
            }
          },
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/icon_bookmark' +
                      ((selectedIndex == 2 ? "_choose.png" : ".png")),
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (onTap != null) {
              onTap!(3);
            }
          },
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/icon_profile' +
                      ((selectedIndex == 3 ? "_choose.png" : ".png")),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
