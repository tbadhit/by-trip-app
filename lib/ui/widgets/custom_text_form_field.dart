import 'package:by_trip/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final String hintText;
  final bool obsecureText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  const CustomTextFormField({
    Key? key,
    required this.title,
    required this.hintText,
    required this.keyboardType,
    this.obsecureText = false,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
          ),
          const SizedBox(
            height: 6,
          ),
          TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            cursorColor: kBlackColor,
            obscureText: obsecureText,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter field';
              }
            },
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  9,
                ),
                borderSide: BorderSide(
                  color: kPrimaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
