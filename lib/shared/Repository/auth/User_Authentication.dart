import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fooddelivery/models/auth.dart';
import 'package:fooddelivery/models/user.dart';
import 'package:fooddelivery/modules/login/cubit/states.dart';
import 'package:fooddelivery/modules/register/cubit/states.dart';
import 'package:fooddelivery/shared/Repository/auth/impl_user_autentication.dart';
import 'package:fooddelivery/shared/constants.dart';
import 'package:fooddelivery/shared/listener/auth/auth_login_listener.dart';
import 'package:fooddelivery/shared/listener/auth/auth_register_listener.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserAuthenticationRepository implements IUserAuthenticationRepository
{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance ;

  GoogleSignInAccount? _googleUser;

  GoogleSignInAuthentication? _googleAuth;

  @override
  void userLogin(AuthModel authModel, AuthLoginListener authListener)
  {
    authListener.loading();
    _firebaseAuth
        .signInWithEmailAndPassword(
          email: authModel.email,
          password: authModel.password,
        )
        .then((value) {

      if(userId != null)
      {
        userId = null ;
        userId ??= value.user!.uid;
      }

      authListener.success(value.user!.uid);


    })
        .catchError((error) {
      authListener.failed(error.toString());
    });
  }

  @override
  void userRegister(AuthModel authModel, AuthRegisterListener authListener )
  {
    try {

      authListener.loading();

      _firebaseAuth
          .createUserWithEmailAndPassword(
        email: authModel.email,
        password: authModel.password,
      )
          .then((value) {
        authListener.success(value.user!.uid );
        if(userId != null)
          {
            userId = null ;
            userId ??= value.user!.uid;
          }
      }).catchError((error) {
        authListener.failed(error.toString());
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        authListener.weakPassword();
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        authListener.userExists();
      }
    } catch (e) {
      print(e);
      authListener.failed(e.toString());
    }
  }

  @override
  void googleSignIn(AuthLoginListener authLoginListener)
  {
    authLoginListener.loading();

    GoogleSignIn().signOut().then((value) async {
      _googleUser = await GoogleSignIn().signIn();

      _googleAuth = await _googleUser!.authentication;

      if (kDebugMode) {
        print('googleAuth.accessToken ${_googleAuth!.accessToken}');
        print('googleAuth.idToken${_googleAuth!.idToken}');
      }

      OAuthCredential? credential = GoogleAuthProvider.credential(
        accessToken: _googleAuth!.accessToken,
        idToken: _googleAuth!.idToken,
      );

      _firebaseAuth.signInWithCredential(credential).then((value) {

        if(userId != null)
        {
          userId = null ;
          userId ??= value.user!.uid;
        }

        authLoginListener.success(value.user!.uid);
      }).catchError((error){
        authLoginListener.failed(error.toString());
      });
    });
  }

  @override
  void facebookSignIn(AuthLoginListener authLoginListener)
  {
    authLoginListener.loading();

    FacebookAuth.instance.logOut().then((value) async {
      LoginResult? result = await FacebookAuth.instance.login();

      if (kDebugMode) {
        print('accessToken => ${result.accessToken!.token}');
      }

      OAuthCredential? facebookAuthCredential =
          FacebookAuthProvider.credential(result.accessToken!.token);

      if (kDebugMode) {
        print('idToken => ${facebookAuthCredential.idToken}');
      }

      _firebaseAuth.signInWithCredential(facebookAuthCredential).then((value) {
        if (kDebugMode) {
          print(value.user!.uid);
          print(value.user!.email);
        }

        if(userId != null)
        {
          userId = null ;
          userId ??= value.user!.uid;
        }

        authLoginListener.success(value.user!.uid);
      }).catchError((error) {
        if (kDebugMode) {
          print('User Login Error => ${error.toString()}');
        }
        authLoginListener.failed(error.toString());
      });
    });
  }

  @override
  void setUserData(String uId, AuthModel authModel, AuthRegisterListener authListener)
  {

    authListener.loading();


    UserModel userModel = UserModel(
      uId: uId,
      image: '',
      email: authModel.email,
      firstName: authModel.firstName,
      lastName: authModel.lastName,
      address: authModel.address,
      phone: authModel.phone,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(userModel.toMap()).then((value)
    {
          authListener.userDataSuccess(uId);
    })
        .catchError((error){
      authListener.userDataFailed(error.toString());
    });
  }

  bool isKeepSignIn = false;

  @override
  void changeSignInOrOut(AuthRegisterListener authListener)
  {
    try{
      authListener.loading();

      _firebaseAuth.signOut() ;
      isKeepSignIn = !isKeepSignIn;
      authListener.success('SignOut') ;
    }
    catch(error){
      authListener.failed(error.toString()) ;
    }

  }
}
