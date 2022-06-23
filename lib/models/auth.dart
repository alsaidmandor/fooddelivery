class AuthModel {
  String _aNamewp = '';
  String _firstName = '';
  String _lastName = '';
  bool _keepMeSignIn = false;
   String _email = '';
   String _password = '' ;
  String address = '';
  String _phone = '';

  static final AuthModel _instance  = AuthModel._();

  AuthModel._() ;

  static AuthModel get instance => _instance;


  bool get keepMeSignIn => _keepMeSignIn;

  set keepMeSignIn(bool value) {
    _keepMeSignIn = value;
  }

  String get firstName => _firstName;

  set firstName(String value) {
    _firstName = value;
  }

  String get aNamewp => _aNamewp;

  set aNamewp(String value) {
    _aNamewp = value;
  }


  String get phone => _phone;

  set phone(String value) {
    _phone = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get lastName => _lastName;

  set lastName(String value) {
    _lastName = value;
  }
}