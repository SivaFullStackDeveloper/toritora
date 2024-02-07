import 'package:flutter/cupertino.dart';

import '../../../../exports.dart';

class AvailabilityAddingScreen extends ConsumerStatefulWidget {
  static const String routeName = '/availabilityScreen';
  const AvailabilityAddingScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<AvailabilityAddingScreen> createState() => _AvailabityAddingScreenState();
}

class _AvailabityAddingScreenState extends ConsumerState<AvailabilityAddingScreen> {
  Duration duration = const Duration(hours: 1, minutes: 23);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///---------------------------------- APP BAR --------------------------------------------
      appBar: CommonWidgets().commonAppBar(context:context,
          text:'Add your available time manually',ref:ref,actions:[],pop:true),
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                _showDialog(

                CupertinoTimerPicker(
                  mode: CupertinoTimerPickerMode.hm,
                  initialTimerDuration: duration,

                  onTimerDurationChanged: (Duration newDuration) {
                    setState(() => duration = newDuration);
                  },
                ));
              },
              child: AvailabilityCustomContainer(text: 'start time'),
            ),
            InkWell(
              onTap: () {

              },
              child: AvailabilityCustomContainer(text: 'finish time'),
            ),
            AvailabilityCustomContainer(text: ''),
            CommonWidgets().commonSizedBox(20.0),
            AvailabilityCustomContainer(text: ''),
            AvailabilityCustomContainer(text: ''),
            CommonWidgets().commonSizedBox(20.0),
            AvailabilityCustomContainer(text: 'Memo'),
            CommonWidgets().commonSizedBox(20.0),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: KColor.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: CustomText(
                    text: 'わからない',
                    color: KColor.whiteColor,
                    fontFamily: KFonts.poppinsBold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The bottom margin is provided to align the popup above the system
        // navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }
}
