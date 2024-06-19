import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart'
    as transitions;
import 'package:step_forward/core/utils/app_colors.dart';
import 'package:step_forward/core/utils/assets_data.dart';
import 'package:step_forward/core/widgets/contact_us_text_button.dart';
import 'package:step_forward/futures/auth/presentation/view_model/register_cubit/register_cubit.dart';
import 'package:step_forward/futures/auth/presentation/views/sign_in_view.dart';
import 'package:step_forward/core/widgets/custom_button.dart';
import 'package:step_forward/futures/auth/presentation/views/widgets/custom_text_field.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  String? email;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Form(
        key: formKey,
        child: ListView(
          children: [
            const SizedBox(
              height: 75,
            ),
            Image.asset(AssetsData.kLogo, height: 100),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Step Forward',
                  style: TextStyle(
                    fontSize: 32,
                    color: AppColors.kPrimaryColor,
                    fontFamily: 'Pacifico',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 75,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
                hintText: 'Email',
                onChanged: (value) {
                  email = value;
                }),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
                isPassword: true,
                hintText: 'Password',
                onChanged: (value) {
                  password = value;
                }),
            const SizedBox(
              height: 50,
            ),
            CustomButton(
              buttonText: '  SIGN UP  ',
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  await BlocProvider.of<RegisterCubit>(context)
                      .registerUser(email: email!, password: password!);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(
                    color: AppColors.kPrimaryColor,
                  ),
                ),
                const SizedBox(width: 30),
                GestureDetector(
                  onTap: () {
                    Get.offAll(
                      const SignInView(),
                      transition: transitions.Transition.rightToLeft,
                      duration: const Duration(milliseconds: 500),
                    );
                  },
                  child: const Text(
                    '         SIGN IN',
                    style: TextStyle(
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const ContactUsTextButton(),
          ],
        ),
      ),
    );
  }
}
