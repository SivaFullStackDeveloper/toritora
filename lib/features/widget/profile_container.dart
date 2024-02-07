import '../../../../exports.dart';

class ProfileContainer extends StatefulWidget {
  String? text;
  String? icon;

  ProfileContainer({Key? key, this.text, this.icon}) : super(key: key);

  @override
  State<ProfileContainer> createState() => _ProfileContainerState();
}

class _ProfileContainerState extends State<ProfileContainer> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(widget.icon!),
          CustomText(
              text: widget.text!,
              color: KColor.blackColor,
              fontFamily: KFonts.poppinsMedium),
        ],
      ),
    );
  }
}
