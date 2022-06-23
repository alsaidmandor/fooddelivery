import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fooddelivery/models/auth.dart';
import 'package:fooddelivery/modules/login/cubit/states.dart';
import 'package:fooddelivery/shared/Repository/auth/impl_user_autentication.dart';
import 'package:fooddelivery/shared/constants.dart';
import 'package:fooddelivery/shared/listener/auth/auth_login_listener.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginCubit extends Cubit<LoginStates> implements AuthLoginListener
{

  final IUserAuthenticationRepository repository ;

  LoginCubit({required this.repository}) : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

   AuthModel? authModel  = AuthModel.instance;





  void userLogin(email , password)
  {
    authModel =  AuthModel.instance.email=email ;
    authModel =  AuthModel.instance.password=password ;
    repository.userLogin(authModel!, this);
  }

  void googleSignIn()
  {
    repository.googleSignIn(this);
  }

  // @override
  // Future<void> signInWithFacebookk() async {
  //   final response = await FacebookAuth.instance.login(permissions: [
  //     'publicProfile',
  //     'email',
  //   ]);
  //   switch (response.status) {
  //     case LoginStatus.success:
  //       final accessToken = response.accessToken;
  //       final userCredential = await FirebaseAuth.instance.signInWithCredential(
  //         FacebookAuthProvider.credential(accessToken!.token),
  //       );
  //       userId = userCredential.user!.uid;
  //       print('uid :  ${userCredential.user!.uid}');
  //       print('userId : $userId');
  //       break;
  //     case LoginStatus.cancelled:
  //       throw FirebaseAuthException(
  //         code: 'ERROR_ABORTED_BY_USER',
  //         message: 'Sign in aborted by user',
  //       );
  //     case LoginStatus.failed:
  //       throw FirebaseAuthException(
  //         code: 'ERROR_FACEBOOK_LOGIN_FAILED',
  //         message: response.message,
  //       );
  //     default:
  //       throw UnimplementedError();
  //   }
  // }

  void facebookSignIn()
  {
    repository.facebookSignIn(this);
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ChangePasswordVisibilityState());
  }

  @override
  void failed(String error) {
    emit(LoginErrorState(error.toString()));
  }

  @override
  void loading() {
    emit(LoginLoadingState());
  }

  @override
  void success(String id) {
    emit(LoginSuccessState(id.toString()));
  }
}
