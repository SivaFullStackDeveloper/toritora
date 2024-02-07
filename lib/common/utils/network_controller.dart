import 'dart:async';

import '../../exports.dart';

final networkControllerProvider =
    ChangeNotifierProvider<NetworkController>((ref) {
  return NetworkController();
});

class NetworkController extends ChangeNotifier {

  bool startAnimation = false;
  InternetConnectionStatus? _connectionStatus;
  late StreamSubscription<InternetConnectionStatus> _subscription;

  checkNetwork(context) {
    InternetConnectionCheckerPlus().onStatusChange.listen((status) {
      _connectionStatus = status;
      if (status == InternetConnectionStatus.connected) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      } else if (status == InternetConnectionStatus.disconnected) {
        showSnack(context,InternetConnectionStatus.disconnected);
      }
    });
  }

  showSnack(context,internetConnectionStatus ) {
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        elevation: 0,
        backgroundColor: KColor.transparentColor,
        duration:const Duration(days: 28000),
        content: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: KColor.darkRedColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.signal_wifi_connected_no_internet_4_outlined,
                  color: KColor.whiteColor,
                ),
                CustomText(
                  text: 'No Internet connection',
                  color: KColor.whiteColor,
                  fontFamily: KFonts.poppinsRegular,
                ),
                Material(
                  color: KColor.darkRedColor,
                  elevation: 10,
                  child: TextButton(
                    onPressed: () {
                      checkNetwork(context);
                    },
                    child: CustomText(
                      text: 'Try again!',
                      color: KColor.whiteColor,
                      fontFamily: KFonts.poppinsRegular,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )));
  }

  listAnimation(){
    startAnimation = true;
    notifyListeners();

  }
}
