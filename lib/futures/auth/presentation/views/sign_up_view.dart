import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:step_forward/core/utils/helpers.dart';
import 'package:step_forward/futures/auth/presentation/view_model/register_cubit/register_cubit.dart';
import 'package:step_forward/futures/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:step_forward/futures/home/presentation/views/home_view.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoadingState) {
        } else if (state is RegisterSuccessState) {
          
          Get.offAll(const HomeView());
        } else if (state is RegisterFailureState) {
          showSnackBar(context, state.e);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is RegisterLoadingState,
          child: const Scaffold(
            body: SignUpViewBody(),
          ),
        );
      },
    );
  }
}
