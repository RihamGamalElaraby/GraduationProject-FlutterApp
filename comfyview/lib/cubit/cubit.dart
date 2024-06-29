import 'package:comfyview/cubit/states.dart';
import 'package:comfyview/screens/ecommerceScreen.dart';
import 'package:comfyview/screens/lostAndFound/lostandFoundScreen.dart';
import 'package:comfyview/screens/resultScreen.dart';
import 'package:comfyview/screens/settingScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComfyviewCubit extends Cubit<ComfyviewState> {
  ComfyviewCubit() : super(initialState());
  static ComfyviewCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    const ResultScreen(),
    LostAndFound(),
    const EcommerceScreen(),
    const SettingScreen()
  ];

  void changeBottomIndex(int index) {
    currentIndex = index;
    emit(SucssesChangeBottimnavState());
  }
}
