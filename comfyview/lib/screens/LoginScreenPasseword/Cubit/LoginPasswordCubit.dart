import 'dart:convert'; // Import the json library

import 'package:comfyview/database/dioHelper.dart';
import 'package:comfyview/database/endPoints.dart';
import 'package:comfyview/models/userModel.dart';
import 'package:comfyview/screens/LoginScreenPasseword/Cubit/LoginPasswordStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPasswordCubit extends Cubit<LoginPasswordStates> {
  LoginPasswordCubit() : super(initialStates());
  static LoginPasswordCubit get(context) => BlocProvider.of(context);

  UserModel? userModel;
  void userLogin({
    required String email,
    required String Password,
  }) async {
    emit((LoadingLoginPasswordstate()));
    try {
      final response = await DioHelper.postData(
        url: SIGNIN,
        data: {
          'email': email,
          'password': Password,
        },
      );

      // Parse response data if it's a string
      final responseData = response.data is String
          ? json.decode(response.data) // Decode the JSON string
          : response.data;

      userModel = UserModel.fromJson(responseData); // Pass the parsed data
      if (response.statusCode == 200) {
        emit(SucessesLoginPasswordstate(userModel));
      } else {
        emit(errorLoginPasswordstate());
      }
    } catch (error) {
      print(error.toString());
    }
  }
}
