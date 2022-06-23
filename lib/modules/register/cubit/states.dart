import 'dart:io';

abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  String? uId;

  RegisterSuccessState(this.uId);
}

class RegisterErrorState extends RegisterStates {
  final String error;

  RegisterErrorState(this.error);
}

class RegisterUserExistsState extends RegisterStates {

}

class RegisterWeakPasswordState extends RegisterStates {

}


class SetUserDataLoadingState extends RegisterStates {}

class SetUserDataSuccessState extends RegisterStates {
  String? uId;

  SetUserDataSuccessState(this.uId);
}

class SetUserDataErrorState extends RegisterStates {
  final String error;

  SetUserDataErrorState(this.error);
}

class RegisterChangePasswordVisibilityState extends RegisterStates {}

class RegisterISKeepSignInOrOutState extends RegisterStates {}

class RegisterPickedImageSuccessState extends RegisterStates {
  final File imagePath ;
  RegisterPickedImageSuccessState( this.imagePath);
}
class RegisterPickedImageErrorState extends RegisterStates {}
class RegisterRemoveIMagePathState extends RegisterStates {}
