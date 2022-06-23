import 'package:fooddelivery/modules/register/cubit/states.dart';

abstract class AuthRegisterListener {
  void loading() ;
  void userDataLoading() ;
  void success(String id );
  void userDataSuccess(String id);
  void failed(String error);
  void userDataFailed(String error);
  void userExists();
  void weakPassword();
}