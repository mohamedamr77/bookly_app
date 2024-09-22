abstract class InternetHomeState{}
class InternetHomeInitialState extends InternetHomeState{}
class InternetHomeFaliureState extends InternetHomeState{
  final String errorMessage;
  InternetHomeFaliureState({required this.errorMessage});
}
class InternetHomeSuccessState extends InternetHomeState{}
