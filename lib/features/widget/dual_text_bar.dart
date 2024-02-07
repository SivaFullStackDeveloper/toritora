import '../../../../exports.dart';

class DualTextBar extends StatefulWidget {
  String? text;
  String? text2;

  DualTextBar({Key? key, this.text, this.text2}) : super(key: key);

  @override
  State<DualTextBar> createState() => _DualTextBarState();
}

class _DualTextBarState extends State<DualTextBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.text!,
          style: TextStyle(
            color: KColor.blackColor,
            fontSize: 16,
            fontFamily: KFonts.poppinsMedium,
          ),
        ),
        Text(
          KString.viewAll,
          style: TextStyle(
            color: KColor.greyColor,
            fontSize: 14,
            fontFamily: KFonts.poppinsRegular,
          ),
        ),
      ],
    );
  }
}

class DualTextBar2 extends StatefulWidget {
  var text1;
  var text2;
  DualTextBar2({Key? key,this.text1,this.text2}) : super(key: key);

  @override
  State<DualTextBar2> createState() => _DualTextBar2State();
}

class _DualTextBar2State extends State<DualTextBar2> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
         widget.text1,
          style: TextStyle(
            color: KColor.blackColor,
            fontSize: 16,
            fontFamily: KFonts.poppinsMedium,
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            widget.text2,
            style: TextStyle(
              color: KColor.darkRedColor,
              fontSize: 14,
              fontFamily: KFonts.poppinsRegular,
            ),
          ),
        ),
      ],
    );
  }
}
class DualTextBar3 extends StatefulWidget {
  String? text;
  String? text2;

  DualTextBar3({Key? key, this.text, this.text2}) : super(key: key);

  @override
  State<DualTextBar3> createState() => _DualTextBar3State();
}

class _DualTextBar3State extends State<DualTextBar3> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.text!,
          style: TextStyle(
            color: KColor.blackColor,
            fontSize: 16,
            fontFamily: KFonts.poppinsMedium,
          ),
        ),
        Text(
          widget.text2!,
          style: TextStyle(
            color: KColor.greyColor,
            fontSize: 14,
            fontFamily: KFonts.poppinsRegular,
          ),
        ),
      ],
    );
  }
}

