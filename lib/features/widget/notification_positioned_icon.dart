import '../../../../exports.dart';

class NotificationPositioned extends StatefulWidget {
  var length;

  NotificationPositioned({Key? key, this.length}) : super(key: key);

  @override
  State<NotificationPositioned> createState() => _NotificationPositionedState();
}

class _NotificationPositionedState extends State<NotificationPositioned> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 0.0,
        right: 00,
        child: Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
              color: KColor.primaryColor,
              borderRadius: BorderRadius.circular(10.0)),
          child: Center(
            child: CustomText(
              text: widget.length.toString(),
              color: KColor.whiteColor,
              fontFamily: KFonts.poppinsRegular,
            ),
          ),
        ));
  }
}
