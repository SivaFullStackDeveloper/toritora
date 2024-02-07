import '../../../../exports.dart';

final homeControllerProvider =
    StateNotifierProvider<HomeController, bool>((ref) {
  return HomeController(true);
});

class HomeController extends StateNotifier<bool> {
  HomeController(super.state);

  /// --------------------------- change function is for changing the model and kikaku buttons -----------------
  void change(bool value) {
    state = value;
  }
}
