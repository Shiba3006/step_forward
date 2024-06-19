import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:step_forward/firebase_options.dart';
import 'package:step_forward/futures/auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:step_forward/futures/auth/presentation/view_model/register_cubit/register_cubit.dart';
import 'package:step_forward/futures/colors_game/presentation/view_model/colors_game_cubit/colors_game_cubit.dart';
import 'package:step_forward/futures/aphabet/presentation/view_model/alphabet_learn_cubit/alphabet_learn_cubit.dart';
import 'package:step_forward/futures/home/presentation/views/home_view.dart';
import 'package:step_forward/futures/splash/views/splash_view.dart';

import 'package:step_forward/simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();
  runApp(const StepFowardApp());
}

class StepFowardApp extends StatelessWidget {
  const StepFowardApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => AlphabetLearnCubit()..initPainterController(),
        ),
        BlocProvider(
          create: (context) => ColorsGameCubit()..updateBox(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
          useMaterial3: true,
        ),
        home: const SplashView(),
      ),
    );
  }
}
