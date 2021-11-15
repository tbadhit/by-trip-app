import 'package:by_trip/models/models.dart';
import 'package:by_trip/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> login(String email, String password) async {
    ApiReturnValue<User> result = await UserServices.login(email, password);

    if (result.value != null) {
      emit(UserLoaded(result.value!));
    } else {
      try {
        emit(UserLoadingFailed(result.message!));
      } catch (e) {
        // ignore: avoid_print
        print(e);
      }
    }
  }

  Future<void> registrasi(User user, String password) async {
    ApiReturnValue<User> result = await UserServices.registrasi(user, password);

    if (result.value != null) {
      emit(UserLoaded(result.value!));
    } else {
      emit(UserLoadingFailed(result.message!));
    }
  }

  Future<void> editProfile(User user) async {
    ApiReturnValue<User> result = await UserServices.editProfile(user);

    if (result.value != null) {
      emit(UserLoaded(result.value!));
    } else {
      emit(UserLoadingFailed(result.message!));
    }
  }
}
