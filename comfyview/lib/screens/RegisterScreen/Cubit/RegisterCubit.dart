import 'dart:convert'; // Import the json library

import 'package:comfyview/database/dioHelper.dart';
import 'package:comfyview/database/endPoints.dart';
import 'package:comfyview/models/userModel.dart';
import 'package:comfyview/screens/RegisterScreen/Cubit/RegisterStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(initialStates());
  static RegisterCubit get(context) => BlocProvider.of(context);
  UserModel? userModel;
  void userRegister({
    required String email,
    required String Password,
    required String name,
    required String gloveid,
  }) async {
    emit(LoadingRegisterstate());
    try {
      final response = await DioHelper.postData(
        url: SIGNUP,
        data: {
          'name': name,
          'email': email,
          'glove_id': gloveid,
          'password': Password,
        },
      );

      // Parse response data if it's a string
      final responseData = response.data is String
          ? json.decode(response.data) // Decode the JSON string
          : response.data;

      userModel = UserModel.fromJson(responseData); // Pass the parsed data
      if (response.statusCode == 200) {
        emit(SucessesRegisterstate(userModel));
      } else {
        emit(errorRegisterstate());
      }
    } catch (error) {
      print(error.toString());
    }
  }
}
