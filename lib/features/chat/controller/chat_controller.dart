import '../../../../exports.dart';

final chatTabControllerProvider =
StateNotifierProvider<ChatTabController, bool>((ref) {
  return ChatTabController(false);
});

class ChatTabController extends StateNotifier<bool> {
  ChatTabController(super.state);

  /// --------------------------- change function is for changing the model and kikaku buttons -----------------
  void change(bool value) {
    state = value;
  }
}

