import 'package:app_galery/services/authentification_service.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';

@injectable
class ContentViewModel extends BaseViewModel {
  final AuthenticationService _authenticationService;

  ContentViewModel(this._authenticationService);

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  Future logout() async {
    await _authenticationService.logout();
  }

  Future initialize() async {
    await _authenticationService.getAppUserFromFirestore();
  }

  void setIndex(int newIndex) {
    _currentIndex = newIndex;
    notifyListeners();
  }
}
