import 'package:intl/intl.dart';


import '../../../../exports.dart';

class ShootingScreen extends ConsumerStatefulWidget {
  static const String routeName = '/shootingScreen';
  const ShootingScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ShootingScreen> createState() => _ShootingScreenState();
}

class _ShootingScreenState extends ConsumerState<ShootingScreen> {
  @override
  Widget build(BuildContext context) {
    var change = ref.watch(shootingControllerProvider);
    return Scaffold(
      appBar: CommonWidgets().commonAppBar(
        context:context,
        actions: [
        Padding(
          padding: KString.padding,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ChatScreen()));
            },
            child: Badge(
              backgroundColor: KColor.buttonColor,
              label: const Text("3"),
              child: Icon(
                Icons.chat,
                color: KColor.primaryColor,
                size: 30,
              ),
            ),
          ),
        ),
      ],pop:false,text:'Shooting Details', ref:ref),

      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Padding(
              padding:  EdgeInsets.only(
                  top:KString.size*Dimens.sizePoint8,
                  left:KString.size*Dimens.sizePoint8,
                  right:KString.size*Dimens.sizePoint8),
              child: Container(
                height: KString.size*Dimens.size7,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: KColor.lightButtonColor.withOpacity(0.1),
                  borderRadius:  BorderRadius.all(Radius.circular(KString.size*Dimens.size1)),
                ),
                child: Padding(
                  padding: KString.padding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      Expanded(
                        child: InkWell(
                          onTap: () => ref
                              .read(shootingControllerProvider.notifier)
                              .change(true),
                          child: Container(
                            decoration: BoxDecoration(
                              color: change == true
                                  ? KColor.buttonColor
                                  : KColor.transparentColor,
                              borderRadius:
                                   BorderRadius.all(Radius.circular(KString.size*Dimens.size1)),
                            ),
                            child: Center(
                              child: CustomText(
                                text: KString.upComing,
                                color: change == true
                                    ? KColor.whiteColor
                                    : KColor.blackColor,
                                fontFamily: KFonts.poppinsBold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () => ref
                              .read(shootingControllerProvider.notifier)
                              .change(false),
                          child: Container(
                            decoration: BoxDecoration(
                              color: change == false
                                  ? KColor.buttonColor
                                  : KColor.transparentColor,
                              borderRadius:
                                   BorderRadius.all(Radius.circular(KString.size*Dimens.size1)),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: KString.padding,
                                    child: CustomText(
                                      text: KString.requestList,
                                      color: change == false
                                          ? KColor.whiteColor
                                          : KColor.blackColor,
                                      fontFamily: KFonts.poppinsBold,
                                    ),
                                  ),
                                  Container(
                                    height: KString.size*Dimens.size3,
                                    width: KString.size*Dimens.size4,
                                    decoration: BoxDecoration(
                                      color: KColor.greyColor.withOpacity(0.8),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(2)),
                                    ),
                                    child: Center(
                                      child: CustomText(
                                        text: '10+',
                                        color: change == false
                                            ? KColor.whiteColor
                                            : KColor.blackColor,
                                        fontFamily: KFonts.poppinsBold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
           CommonWidgets().commonSizedBox(KString.size*Dimens.size2),
        change == true?Container(
          height: KString.size*Dimens.size6,
          width: double.infinity,
          decoration: BoxDecoration(
            color: KColor.buttonColor.withOpacity(0.1),
          ),
          child: Padding(
            padding:KString.padding,
            child: Row(
              children: [
                CommonWidgets().commonSizedBoxWidth(KString.size*Dimens.size2),
                CustomText(
                  text: DateFormat.yMMMEd().format(DateTime.now()),
                  color: KColor.blackColor,
                  fontFamily: KFonts.poppinsBold,
                ),
              ],
            ),
          ),
        ):SizedBox(),

            CommonWidgets().commonSizedBox(change == true?20.0:0.0),
            CommonWidgets().shootingList(change),
          ],
        ),
      ),
    );
  }
}
