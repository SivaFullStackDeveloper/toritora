import '../../../../exports.dart';

class CustomText extends StatefulWidget {
  String? text;
  Color? color;
  String? fontFamily;

  CustomText({Key? key, this.text, this.color, this.fontFamily})
      : super(key: key);

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text!,
      style: TextStyle(
        color: widget.color!,
        fontFamily: widget.fontFamily,

      ),
    );
  }
}

class CustomText2 extends StatefulWidget {
  String? text;
  Color? color;
  String? fontFamily;

  CustomText2({Key? key, this.text, this.color, this.fontFamily})
      : super(key: key);

  @override
  State<CustomText2> createState() => _CustomText2State();
}

class _CustomText2State extends State<CustomText2> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text!,
      style: TextStyle(
        color: widget.color!,
        fontFamily: widget.fontFamily,
        fontSize: KString.size*Dimens.size2Point2,
      ),
    );
  }
}

class CustomTextForKikaku extends StatefulWidget {
  String? text;
  Color? color;
  String? fontFamily;

  CustomTextForKikaku({Key? key, this.text, this.color, this.fontFamily})
      : super(key: key);

  @override
  State<CustomTextForKikaku> createState() => _CustomTextForKikakuState();
}

class _CustomTextForKikakuState extends State<CustomTextForKikaku> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text!,
      style: TextStyle(
        color: widget.color!,
        fontFamily: widget.fontFamily,
        fontSize: KString.size*Dimens.size2,
      ),
    );
  }
}

class CustomTextForAvailability extends StatefulWidget {
  String? text;
  Color? color;
  String? fontFamily;

  CustomTextForAvailability({Key? key, this.text, this.color, this.fontFamily})
      : super(key: key);

  @override
  State<CustomTextForAvailability> createState() =>
      _CustomTextForAvailabilityState();
}

class _CustomTextForAvailabilityState extends State<CustomTextForAvailability> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text!,
      style: TextStyle(
        color: widget.color!,
        fontFamily: widget.fontFamily,
        fontSize: KString.size*Dimens.size1Point6,
      ),
    );
  }
}
