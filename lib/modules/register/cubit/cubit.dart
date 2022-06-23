import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:fooddelivery/models/auth.dart';
import 'package:fooddelivery/models/user.dart';
import 'package:fooddelivery/modules/register/cubit/states.dart';
import 'package:fooddelivery/shared/Repository/auth/impl_user_autentication.dart';
import 'package:fooddelivery/shared/listener/auth/auth_register_listener.dart';
import 'package:image_picker/image_picker.dart';

class RegisterCubit extends Cubit<RegisterStates>
    implements AuthRegisterListener {

  final IUserAuthenticationRepository repository ;



  RegisterCubit({ required this.repository}) : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  AuthModel? authModel = AuthModel.instance  ;

  void userRegister(name , email ,password , isKeepSignIn) {
     AuthModel.instance.aNamewp=name ;
     AuthModel.instance.email=email ;
     AuthModel.instance.password=password ;
     AuthModel.instance.keepMeSignIn=isKeepSignIn ;
  }

  void addUserDataToDatabase(firstName , lastName , mobile )
  {
      AuthModel.instance.firstName=firstName ;
      AuthModel.instance.lastName=lastName ;
      AuthModel.instance.phone=mobile ;  }

  /// Get from gallery
  File? imagePath;
  var picker = ImagePicker();

   getImageFromGallery() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      imagePath = File(pickedFile.path);
      emit(RegisterPickedImageSuccessState(imagePath!));
    } else {
      print('No image selected.');
      emit(RegisterPickedImageErrorState());
    }
  }

   getImageFromCamera() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,
    );

    if (pickedFile != null) {
      imagePath = File(pickedFile.path);
      emit(RegisterPickedImageSuccessState(imagePath!));
    } else {
      print('No image selected.');
      emit(RegisterPickedImageErrorState());
    }
  }

  void removePathImage() {
    imagePath = null;
    emit(RegisterRemoveIMagePathState());
  }

  // _getFromCamera() async {
  //   PickedFile pickedFile = await ImagePicker().getImage(
  //     source: ImageSource.camera,
  //     maxWidth: 1800,
  //     maxHeight: 1800,
  //   );
  //   if (pickedFile != null) {
  //     File imageFile = File(pickedFile.path);
  //   }
  // }



  // repository.userRegister(authModel!, this) ;


  IconData suffix = IconlyBold.show;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? IconlyBold.show : IconlyBold.hide;

    emit(RegisterChangePasswordVisibilityState());
  }


  @override
  void failed(String error)
  {
    emit(RegisterErrorState(error));
  }

  @override
  void loading()
  {
    emit(RegisterLoadingState());
  }

  @override
  void success(String id)
  {
    emit(RegisterSuccessState(id));
  }

  @override
  void userDataFailed(String error)
  {
    emit(SetUserDataErrorState(error.toString()));
  }

  @override
  void userDataLoading()
  {
    emit(SetUserDataLoadingState());
  }

  @override
  void userDataSuccess(String id)
  {
    emit(SetUserDataSuccessState(id));
  }

  @override
  void userExists()
  {
emit(RegisterUserExistsState());
  }

  @override
  void weakPassword()
  {
    emit(RegisterWeakPasswordState());
  }
}
