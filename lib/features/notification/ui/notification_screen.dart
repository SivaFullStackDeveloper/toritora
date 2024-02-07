import '../../../../exports.dart';

class NotificationScreen extends ConsumerWidget {
  static const String routeName = '/notificationScreen';
  NotificationScreen({Key? key}) : super(key: key);

  var profileItemIcons = [
    KAssets.cam,
    KAssets.smile,
    KAssets.fav,
    KAssets.payments,
    KAssets.finance,
    KAssets.college,
  ];
  var profileSettingsIcons = [
    KAssets.profile,
    KAssets.bell,
    KAssets.privacy,
    KAssets.help,
    KAssets.feedback,
    KAssets.logout,
  ];

  var profileItemText = [
    KString.chatMessages,
    KString.ichiSession,
    KString.kikaku,
    KString.toritai,
    KString.fromToritora,
    KString.others,
  ];

  var profileSettingsText = [
    KString.changeUserName,
    KString.notificationSettings,
    KString.privacyPolicy,
    KString.help,
    KString.feedback,
    KString.logout,
  ];

  var chatList = ['kikaku'];
  var ichiList = [];
  var kikakuList = [];
  var toritaiList = [];
  var toritoraList = [];
  var othersList = [];

  List<List> allList = [];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var notification = ref.watch(notificationControllerProvider);
    return Scaffold(
      appBar: CommonWidgets().commonAppBar(
          context: context,
          text: KString.notification,
          ref: ref,
          actions: [
            Icon(
              Icons.more_vert,
              color: KColor.primaryColor,
            ),
          ],
          pop: true),
      body: SafeArea(
          child: Padding(
        padding:  EdgeInsets.all(KString.size*Dimens.size1Point8),
        child: Column(
          children: [
            CommonWidgets().commonSizedBox(KString.size*Dimens.size1),
            GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 3 / 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: 6,
                itemBuilder: (BuildContext ctx, index) {
                  return InkWell(
                    onTap: () {
                      ref
                          .read(notificationControllerProvider.notifier)
                          .updateList(profileItemText[index]);
                    },
                    child: Card(
                      color: notification.notificationItemList
                                  .join('')
                                  .toString() ==
                              profileItemText[index]
                          ? KColor.lightButtonColor
                          : KColor.whiteColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(KString.size*Dimens.size1)),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(KString.size*Dimens.sizePoint6)),
                            child: Padding(
                              padding: KString.padding,
                              child: Center(
                                child: NotificationContainer(
                                  text: profileItemText[index],
                                  color: notification.notificationItemList
                                              .join('')
                                              .toString() ==
                                          profileItemText[index]
                                      ? KColor.whiteColor
                                      : KColor.blackColor,
                                ),
                              ),
                            ),
                          ),
                          NotificationPositioned(length: chatList.length),
                        ],
                      ),
                    ),
                  );
                }),
              CommonWidgets().commonSizedBox(KString.size*Dimens.size2),
            ///-----------------------------------   Show notification List -------------------------------------------------
            showNotificationList(ref),
          ],
        ),
      )),
    );
  }

  showNotificationList(ref) {
    var refNotificationController =
        ref.watch(notificationControllerProvider).notificationItemList;
    return refNotificationController.contains(KString.chatMessages)
        ? NotificationListWidget(list: chatList)
        : refNotificationController.contains(KString.ichiSession)
            ? NotificationListWidget(list: const [])
            : refNotificationController.contains(KString.kikaku)
                ? NotificationListWidget(list: const [])
                : refNotificationController.contains(KString.toritai)
                    ? NotificationListWidget(list: const [])
                    : refNotificationController.contains(KString.fromToritora)
                        ? NotificationListWidget(list: const [])
                        : refNotificationController.contains(KString.others)
                            ? NotificationListWidget(list: const [])
                            : const NoNotificationScreen();
  }
}
