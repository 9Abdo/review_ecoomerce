import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review_ecommerce/core/helper/cach_helper.dart';
import 'package:review_ecommerce/features/Auth/cubit/login_state.dart';
import 'package:review_ecommerce/features/models/user_model.dart';
import 'package:review_ecommerce/features/services/user_services.dart';

class LoginCubit extends Cubit<LoginState> {
  final UserServices userServices;

  LoginCubit({required this.userServices}) : super(InitState());

  Future<void> loginCubit({
    required String username,
    required String password,
  }) async {
    emit(LoadingState());

    try {
      final UserModel user = await userServices.postLogin(
        username: username,
        password: password,
      );

      if (user.token.isNotEmpty) {
        await CachHelper.saveToken(user.token);
        print(user.token);
        emit(SuccessState());
      } else {
        emit(FailureState(error: "Token not found"));
      }
    } catch (e) {
      emit(FailureState(error: e.toString()));
    }
  }
}
