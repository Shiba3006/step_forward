import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:step_forward/core/utils/helpers.dart';
import 'package:step_forward/futures/auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:step_forward/futures/auth/presentation/views/widgets/sign_in_view_body.dart';
import 'package:step_forward/futures/home/presentation/views/home_view.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoadingState) {
        } else if (state is LoginSuccessState) {
          print('==================> user signed in');
          Get.offAll(const HomeView());
        } else if (state is LoginFailureState) {
          showSnackBar(context, state.e);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoginLoadingState,
          child: const Scaffold(
            body: SignInViewBody(),
          ),
        );
      },
    );
  }
}
