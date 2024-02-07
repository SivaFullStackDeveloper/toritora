import '../../../../exports.dart';

class NoNotificationScreen extends StatefulWidget {
  const NoNotificationScreen({Key? key}) : super(key: key);

  @override
  State<NoNotificationScreen> createState() => _NoNotificationScreenState();
}

class _NoNotificationScreenState extends State<NoNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              color: KColor.primaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(100)),
          child: SvgPicture.asset(
            KAssets.bell,
          ),
        ),
        SizedBox(height: 20),
        SvgPicture.asset(KAssets.noNotificationsYet),
        SizedBox(height: 20),
        SvgPicture.asset(KAssets.later),
      ],
    );
  }
}
