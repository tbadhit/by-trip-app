import 'package:by_trip/ui/widgets/custom_button.dart';
import 'package:by_trip/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../shared/theme.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Center(
        child: Container(
          margin: EdgeInsets.only(top: 30),
          child: Text(
            'Daftar',
            style: blackTextStyle.copyWith(
              fontSize: 24,
              fontWeight: semiBold,
            ),
          ),
        ),
      );
    }

    Widget imageLogin() {
      return Container(
        width: 310,
        height: 210,
        margin: EdgeInsets.symmetric(horizontal: 50),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image_register.png'),
          ),
        ),
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
          title: 'Daftar',
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

    Widget tacButton() {
      return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(
          top: 40,
          bottom: 30,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sudah punya akun?',
              style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text(
                'Masuk',
                style: yellowTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: light,
                ),
              ),
            ),
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
              tacButton(),
            ],
          ),
        ),
      ),
    );
  }
}
