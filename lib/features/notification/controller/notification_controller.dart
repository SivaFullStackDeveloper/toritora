import '../../../../exports.dart';

final notificationControllerProvider =
    ChangeNotifierProvider<NotificationController>((ref) {
  return NotificationController();
});

class NotificationController extends ChangeNotifier {
  var notificationItemList = [];

  updateList(value) {
    notificationItemList.clear();
    notifyListeners();
    if (notificationItemList.contains(value)) {
      notifyListeners();
    } else {
      notificationItemList.add(value);
      notifyListeners();
      notificationItemList.toString();
      notifyListeners();
      print( notificationItemList.toString());
    }
  }
}
