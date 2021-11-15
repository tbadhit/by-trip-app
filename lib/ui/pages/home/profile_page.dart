import 'package:by_trip/cubit/cubit.dart';
import 'package:by_trip/shared/theme.dart';
import 'package:by_trip/ui/pages/edit_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {


  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var user = (context.read<UserCubit>().state as UserLoaded).user;
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Text(
          'Profile',
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget imageLogin() {
      return Padding(
        padding: const EdgeInsets.only(top: 90),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 40),
              width: 150,
              height: 150,
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

    Widget profile() {
      return Padding(
        padding: const EdgeInsets.only(top: 270),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Text(
              user.name,
              style: blackTextStyle.copyWith(
                fontSize: 24,
                fontWeight: regular,
              ),
            ),
            
            Text(
              user.city,
              style: greyTextStyle.copyWith(
                fontSize: 18,
                fontWeight: regular,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    
                    Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePage(user: user,)));

                  },
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/icon_edit.png',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/login', (Route<dynamic> route) => false);
                  },
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/icon_logout.png',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: Stack(
            children: [
              title(),
              imageLogin(),
              profile(),
            ],
          ),
        ),
      ),
    );
  }
}
