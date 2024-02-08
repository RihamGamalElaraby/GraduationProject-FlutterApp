import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comfyview/cubit/states.dart';

class ComfyviewCubit extends Cubit<ComfyviewState> {
  ComfyviewCubit() : super(initialState());
  static ComfyviewCubit get(context) => BlocProvider.of(context);
}
