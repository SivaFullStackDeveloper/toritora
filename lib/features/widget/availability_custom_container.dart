import '../../../../exports.dart';

class AvailabilityCustomContainer extends StatefulWidget {
  var text;

  AvailabilityCustomContainer({Key? key, this.text}) : super(key: key);

  @override
  State<AvailabilityCustomContainer> createState() =>
      _AvailabilityCustomContainerState();
}

class _AvailabilityCustomContainerState
    extends State<AvailabilityCustomContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(
          color: KColor.greyColor,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          CustomTextForAvailability(
            text: '${widget.text} ',
            fontFamily: KFonts.poppinsMedium,
            color: KColor.blackColor,
          ),
          SizedBox(width: 20),
          CustomTextForAvailability(
            color: KColor.blackColor,
            text: '',
            fontFamily: KFonts.poppinsMedium,
          ),
        ],
      ),
    );
  }
}
