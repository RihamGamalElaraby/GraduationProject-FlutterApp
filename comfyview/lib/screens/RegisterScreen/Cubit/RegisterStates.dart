import 'package:comfyview/models/userModel.dart';

class RegisterStates {}

class initialStates extends RegisterStates {}

class LoadingRegisterstate extends RegisterStates {}

class SucessesRegisterstate extends RegisterStates {
  final UserModel? userModel;
  SucessesRegisterstate(this.userModel);
}

class errorRegisterstate extends RegisterStates {
  final String? error;
  errorRegisterstate({this.error});
}
