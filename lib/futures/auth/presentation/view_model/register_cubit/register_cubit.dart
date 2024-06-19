import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());

  Future<void> registerUser(
      {required String email, required String password}) async {
    emit(RegisterLoadingState());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(RegisterSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(RegisterFailureState(e: e.message ?? 'Something went wrong!'));
    } catch (e) {
      emit(RegisterFailureState(e: 'Something went wrong! $e'));
    }
  }

  
}
