import 'package:by_trip/cubit/cubit.dart';
import 'package:by_trip/models/models.dart';
import 'package:by_trip/ui/widgets/custom_button.dart';
import 'package:by_trip/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key, this.user}) : super(key: key);

  final User? user;

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  late List<String> cities;

  late String selectedCity;

  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    cities = ['Makassar', 'Tulungagung', 'Banyumas'];
    selectedCity = widget.user!.city;
    nameController.text = widget.user!.name;
    emailController.text = widget.user!.email;
    phoneController.text = widget.user!.phone;
  }

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
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
            const SizedBox(
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
                margin: const EdgeInsets.only(top: 40),
                width: 180,
                height: 180,
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
                width: 50,
                height: 50,
                margin: const EdgeInsets.only(top: 180, left: 110),
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
            controller: nameController,
            title: 'Nama Lengkap',
            hintText: 'Nama lengkapmu',
            keyboardType: TextInputType.text);
      }

      Widget emailInput() {
        return CustomTextFormField(
            controller: emailController,
            title: 'Email',
            hintText: 'Email',
            obsecureText: false,
            keyboardType: TextInputType.emailAddress);
      }

      // Un use :
      // Widget passwordInput() {
      //   return CustomTextFormField(
      //     controller: passwordController,
      //     title: 'Password',
      //     hintText: 'Password',
      //     obsecureText: true,
      //     keyboardType: TextInputType.text
      //   );
      // }

      Widget phoneInput() {
        return CustomTextFormField(
            controller: phoneController,
            title: 'Phone',
            hintText: 'Phone',
            obsecureText: false,
            keyboardType: TextInputType.phone);
      }

      Widget cityInput() {
        return Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Text(
                  "City",
                  style: TextStyle(color: kBlackColor),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey)),
                child: DropdownButton(
                    isExpanded: true,
                    underline: const SizedBox(),
                    value: selectedCity,
                    items: cities
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(
                                e,
                                style: const TextStyle(color: Colors.black),
                              ),
                            ))
                        .toList(),
                    onChanged: (item) {
                      setState(() {
                        selectedCity = item as String;
                      });
                    }),
              ),
            ],
          ),
        );
      }

      Widget submitButton() {
        return CustomButton(
          textStyle: GoogleFonts.poppins(color: kWhiteColor),
          title: 'Simpan',
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              if (nameController.text.length < 3) {
                displayToastMessage(
                    "name must me atleast 3 characters", context);
              } else if (!emailController.text.contains("@")) {
                displayToastMessage("Email address is not Valid", context);
              } else if (phoneController.text.length != 12) {
                displayToastMessage("Phone must be atleast 12 number", context);
              } else {
                User user = User(
                    id: widget.user!.id,
                    name: nameController.text,
                    email: emailController.text,
                    phone: phoneController.text,
                    city: selectedCity);
                setState(() {
                  isLoading = true;
                });
                UserState state = context.read<UserCubit>().state;
                if (state is UserLoaded) {
                  await context.read<UserCubit>().editProfile(user);
                  context.read<WisataCubit>().getWisata(user);
                  context.read<BookmarkCubit>().getBookmarks(user);
                  Navigator.pop(context);
                } else {
                  showTopSnackBar(
                    context,
                    CustomSnackBar.error(
                      message: (state as UserLoadingFailed).message,
                    ),
                  );
                  setState(() {
                    isLoading = false;
                  });
                }
              }
            }
          },
        );
      }

      return Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(
            defaultRadius,
          ),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              nameInput(),
              emailInput(),
              phoneInput(),
              cityInput(),
              (isLoading == true)
                  ? Center(
                      child: loadingIndicator,
                    )
                  : submitButton(),
            ],
          ),
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

  displayToastMessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }
}
