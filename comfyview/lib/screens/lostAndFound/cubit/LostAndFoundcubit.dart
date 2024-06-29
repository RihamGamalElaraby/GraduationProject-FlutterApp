import 'package:comfyview/database/dioHelper.dart';
import 'package:comfyview/screens/lostAndFound/cubit/lostAndFoundStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LostAndFoundCubit extends Cubit<LostAndFoundStates> {
  LostAndFoundCubit() : super(InitialStateLost());
  static LostAndFoundCubit get(context) => BlocProvider.of(context);
  String? location;

  Future<void> LocationBack({required String searchValue}) async {
    emit(LoadingStatesLost());
    try {
      final response = await DioHelper.postData(
        url: 'https://graduationproject-backend.onrender.com/api/Search',
        data: {
          'searchValue': searchValue,
        },
      );
      if (response.data['data'] != null && response.data['data'] is String) {
        location = response.data['data'];
        emit(SucssesStatesLost());
      } else {
        emit(FailStatesLost());
      }
    } catch (e) {
      print("Error fetching location: $e");
      emit(FailStatesLost());
    }
  }
}
