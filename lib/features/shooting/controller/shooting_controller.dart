import '../../../../exports.dart';

final shootingControllerProvider =
StateNotifierProvider<ShootingController, bool>((ref) {
  return ShootingController(false);
});

class ShootingController extends StateNotifier<bool> {
  ShootingController(super.state);

  void change(bool value) {
    state = value;
  }
}