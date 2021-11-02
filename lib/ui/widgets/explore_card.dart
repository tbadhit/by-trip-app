// import 'package:by_trip/shared/theme.dart';
// import 'package:flutter/material.dart';

// class ExploreCard extends StatelessWidget {
//   const ExploreCard({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 350,
//       height: 300,
//       child: Stack(
//         children: [
//           Container(
//             margin: EdgeInsets.only(top: 30),
//             width: 270,
//             height: 140,
//             decoration: BoxDecoration(
//                 color: kWhiteColor,
//                 borderRadius: BorderRadius.circular(defaultRadius)),
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Container(
//                     width: 100,
//                     height: 100,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       image: DecorationImage(
//                         fit: BoxFit.cover,
//                         image: AssetImage('assets/image_explore_card.png'),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 35, left: 80),
//                     child: Row(
//                       children: [
//                         Container(
//                           width: 15,
//                           height: 15,
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               fit: BoxFit.cover,
//                               image: AssetImage('assets/icon_star.png'),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 4,
//                         ),
//                         Text(
//                           '4.5',
//                           style: blackTextStyle.copyWith(
//                             fontSize: 14,
//                             fontWeight: bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                 'Puncak Bogor',
//                 style: blackTextStyle.copyWith(
//                   fontSize: 20,
//                   fontWeight: bold,
//                 ),
//               ),
//               Text(
//                 'Bogor, Jawa Barat',
//                 style: greyTextStyle.copyWith(
//                   fontSize: 12,
//                   fontWeight: medium,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:by_trip/shared/theme.dart';

class ExploreCard extends StatelessWidget {
  final String name;
  final String location;
  const ExploreCard({
    Key? key,
    required this.name,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      margin: EdgeInsets.only(bottom: 20),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        elevation: 10,
        child: Row(
          children: [
            Container(
              width: 90,
              height: 90,
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/image_destination2.png',
                      ),
                      fit: BoxFit.cover)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 150,
                  child: Text(
                    name,
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  width: 150,
                  child: Text(
                    location,
                    style: greyTextStyle.copyWith(
                        fontSize: 12, fontWeight: medium),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
