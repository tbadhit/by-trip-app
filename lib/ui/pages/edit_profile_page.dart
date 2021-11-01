import 'package:by_trip/ui/widgets/custom_button.dart';
import 'package:by_trip/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../shared/theme.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: Container(
                width: 33,
                height: 33,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/icon_back.png',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              'Edit Profile',
              style: blackTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
          ],
        ),
      );
    }

    Widget imageLogin() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 40),
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/image_profile.png',
                    ),
                  ),
                ),
              ),
              Container(
                width: 60,
                height: 60,
                margin: EdgeInsets.only(top: 200, left: 120),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/icon_edit_photo.png',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    }

    Widget inputSection() {
      Widget nameInput() {
        return CustomTextFormField(
          title: 'Nama Lengkap',
          hintText: 'Nama lengkapmu',
        );
      }

      Widget emailInput() {
        return CustomTextFormField(
          title: 'Email',
          hintText: 'Alamat emailmu',
        );
      }

      Widget passwordInput() {
        return CustomTextFormField(
          title: 'Password',
          hintText: 'Password',
          obsecureText: true,
        );
      }

      Widget cityInput() {
        return CustomTextFormField(
          title: 'Pilih Kota',
          hintText: 'Kotamu',
        );
      }

      Widget submitButton() {
        return CustomButton(
          textStyle: GoogleFonts.poppins(color: kWhiteColor),
          title: 'Simpan',
          onPressed: () {
            Navigator.pushNamed(context, '/main');
          },
        );
      }

      return Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(
            defaultRadius,
          ),
        ),
        child: Column(
          children: [
            nameInput(),
            emailInput(),
            passwordInput(),
            cityInput(),
            submitButton(),
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
          child: ListView(
            children: [
              title(),
              imageLogin(),
              inputSection(),
            ],
          ),
        ),
      ),
    );
  }
}
