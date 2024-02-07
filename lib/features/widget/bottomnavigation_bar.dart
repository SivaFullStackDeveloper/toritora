import 'package:toritora/constant/dimens.dart';

import '../../../../exports.dart';

class BottomNavigationWidget extends ConsumerStatefulWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<BottomNavigationWidget> createState() =>
      _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState
    extends ConsumerState<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    final position = ref.watch(dashboardControllerProvider);

    return BottomAppBar(
        /*  shape: CircularNotchedRectangle(),
        notchMargin: -140,*/
        child: Container(
      height: KString.size*Dimens.size8,
      child: Padding(
        padding: KString.padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MaterialButton(
                minWidth: KString.size*Dimens.size4,
                onPressed: () {
                  ref.read(dashboardControllerProvider.notifier).setPosition(0);
                },
                child: Column(
                  children: [
                    SvgPicture.asset(
                      KAssets.home,
                      width: KString.size*Dimens.size2Point3,
                      height: KString.size*Dimens.size2Point3,
                      color: position == 0
                          ? KColor.primaryColor
                          : KColor.greyColor,
                    ),
                    CustomText(
                      text: KString.home,
                      color: position == 0
                          ? KColor.primaryColor
                          : KColor.greyColor,
                      fontFamily: KFonts.poppinsRegular,
                    ),
                  ],
                )),
            MaterialButton(
                minWidth: KString.size*Dimens.size4,
                onPressed: () {
                  ref.read(dashboardControllerProvider.notifier).setPosition(1);
                },
                child: Column(
                  children: [
                    Icon(
                      Icons.calendar_month_rounded,
                      color: position == 1
                          ? KColor.primaryColor
                          : KColor.greyColor,
                    ),
                    CustomText(
                      text: KString.calendar,
                      color: position == 1
                          ? KColor.primaryColor
                          : KColor.greyColor,
                      fontFamily: KFonts.poppinsRegular,
                    ),
                  ],
                )),
            MaterialButton(
                minWidth: KString.size*Dimens.size4,
                onPressed: () {
                  ref.read(dashboardControllerProvider.notifier).setPosition(2);
                },
                child: Column(
                  children: [
                    Icon(Icons.flip_camera_ios,
                        color: position == 2
                            ? KColor.primaryColor
                            : KColor.greyColor),
                    CustomText(
                      text: KString.shooting,
                      color: position == 2
                          ? KColor.primaryColor
                          : KColor.greyColor,
                      fontFamily: KFonts.poppinsRegular,
                    ),
                  ],
                )),
            MaterialButton(
                minWidth: KString.size*Dimens.size4,
                onPressed: () {
                  ref.read(dashboardControllerProvider.notifier).setPosition(3);
                },
                child: Column(
                  children: [
                    SvgPicture.asset(
                      KAssets.profile,
                      width: KString.size*Dimens.size2Point3,
                      height: KString.size*Dimens.size2Point3,
                      color: position == 3
                          ? KColor.primaryColor
                          : KColor.greyColor,
                    ),
                    CustomText(
                      text: KString.profile,
                      color: position == 3
                          ? KColor.primaryColor
                          : KColor.greyColor,
                      fontFamily: KFonts.poppinsRegular,
                    ),
                  ],
                )),
          ],
        ),
      ),
      //BottomNavigationWidget(),
    ));
  }
}
