import '../../../../exports.dart';

class NotificationListWidget extends StatefulWidget {
  List list;

  NotificationListWidget({Key? key, required this.list}) : super(key: key);

  @override
  State<NotificationListWidget> createState() => _NotificationListWidgetState();
}

class _NotificationListWidgetState extends State<NotificationListWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: widget.list.isEmpty
          ? const NoNotificationScreen()
          : ListView.builder(
              shrinkWrap: true,
              itemCount: widget.list.length,
              itemBuilder: (BuildContext context, i) {
                return Padding(
                  padding: KString.padding,
                  child: Material(
                    elevation: 2,
                    child: Container(
                      height: KString.size*Dimens.size10,
                      width: double.infinity,
                    ),
                  ),
                );
              }),
    );
  }
}
