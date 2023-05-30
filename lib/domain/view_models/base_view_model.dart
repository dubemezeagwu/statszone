import 'package:statszone/domain/app_domain.dart';

class BaseViewModel extends ChangeNotifier {
  AppState _appState = AppState.Idle;
  AppState get appState => _appState;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  void setErrorMessage (String errorMessage){
    _errorMessage = errorMessage;
  }

  void setAppState (AppState appState) {
    _appState = appState;
  }
}