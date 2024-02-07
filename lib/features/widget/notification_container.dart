import '../../../../exports.dart';

class NotificationContainer extends ConsumerStatefulWidget {
  String? text;
  var color;

  NotificationContainer({Key? key, this.text, this.color}) : super(key: key);

  @override
  ConsumerState<NotificationContainer> createState() =>
      _NotificationContainerState();
}

class _NotificationContainerState extends ConsumerState<NotificationContainer> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomText(
              text: widget.text!,
              color: widget.color,
              fontFamily: KFonts.poppinsMedium),
        ],
      ),
    );
  }
}

class FilterContainer extends ConsumerStatefulWidget {
  String? text;
  var color;

  FilterContainer({Key? key, this.text, this.color}) : super(key: key);

  @override
  ConsumerState<FilterContainer> createState() => _FilterContainerState();
}

class _FilterContainerState extends ConsumerState<FilterContainer> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomText(
              text: widget.text!,
              color: widget.color,
              fontFamily: KFonts.poppinsMedium),
        ],
      ),
    );
  }
}
