import 'package:bloc/bloc.dart';
import 'package:sgl/screens/home/home.dart';
import 'package:sgl/screens/settings.dart';
import 'main.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  SettingsClickedEvent,
  LogOut,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState =>Home();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield Home();
        break;
      case NavigationEvents.SettingsClickedEvent:
        yield Settings();
        break;
      case NavigationEvents.LogOut:
        yield LogIn();
        break;
    }
  }
}
