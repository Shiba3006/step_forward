import 'package:flutter/material.dart';
import 'package:step_forward/core/utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, this.hintText = '', this.onChanged, this.isPassword = false});
  final String hintText;
  final Function(String)? onChanged;
  final bool? isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Field cannot be empty';
        }
        return null;
      },
      keyboardType:
          isPassword! ? TextInputType.text : TextInputType.emailAddress,
      obscureText: isPassword!,
      style: const TextStyle(color: AppColors.kPrimaryColor),
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColors.kPrimaryColor,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.kPrimaryColor,
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
