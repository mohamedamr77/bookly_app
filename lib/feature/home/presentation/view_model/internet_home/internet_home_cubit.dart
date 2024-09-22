import 'package:bloc/bloc.dart';
import 'package:booklyapp/core/error/print_faliure.dart';
import 'package:booklyapp/feature/home/data/repo/home_repo.dart';
import 'internet_home_state.dart';

class InternetHomeCubit extends Cubit<InternetHomeState> {
  InternetHomeCubit(this.homeRepo) : super(InternetHomeInitialState());
  final HomeRepo homeRepo;
  connectWithInternet() async {
    emit(InternetHomeLoadingState());
    PrintFailure.errorMessage(message: "loaDING INTERNET");
    var result = await homeRepo.connectWithInternet();
    result.fold((faliureConnect) {
      print('Failed: ${faliureConnect.errorMessage}'); // Debugging print
      emit(InternetHomeFaliureState(errorMessage: faliureConnect.errorMessage));
    }, (rightConnect) {
      print('Success: Connected'); // Debugging print
      emit(InternetHomeSuccessState());
    });
  }
}
