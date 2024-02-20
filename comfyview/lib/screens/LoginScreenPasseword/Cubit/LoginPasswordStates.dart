import 'package:comfyview/models/userModel.dart';

class LoginPasswordStates {}

class initialStates extends LoginPasswordStates {}

class LoadingLoginPasswordstate extends LoginPasswordStates {}

class SucessesLoginPasswordstate extends LoginPasswordStates {
  final UserModel? userModel;
  SucessesLoginPasswordstate(this.userModel);
}

class errorLoginPasswordstate extends LoginPasswordStates {
  final String? error;
  errorLoginPasswordstate({this.error});
}
