import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fooddelivery/models/auth.dart';
import 'package:fooddelivery/modules/register/cubit/states.dart';
import 'package:fooddelivery/shared/listener/auth/auth_login_listener.dart';
import 'package:fooddelivery/shared/listener/auth/auth_register_listener.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class IUserAuthenticationRepository
{
   void userRegister(AuthModel authModel , AuthRegisterListener authListener) ;
   void userLogin(AuthModel authModel , AuthLoginListener authListener);
  void googleSignIn(AuthLoginListener authLoginListener);
  void facebookSignIn(AuthLoginListener authLoginListener);
  void setUserData( String uId , AuthModel authModel , AuthRegisterListener authListener) ;
  void changeSignInOrOut(AuthRegisterListener authListener) ;
}