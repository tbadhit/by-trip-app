import 'package:by_trip/shared/theme.dart';
import 'package:flutter/material.dart';

class IconCategory extends StatelessWidget {
  final Function() onTap;
  final String name;
  final String imageUrl;
  const IconCategory({
    Key? key,
    required this.onTap,
    required this.name,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  imageUrl,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            name,
            style: greyTextStyle.copyWith(
              fontSize: 10,
              fontWeight: light,
            ),
          ),
        ],
      ),
    );
  }
}
