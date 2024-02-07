import 'package:intl/intl.dart';

import '../../../../exports.dart';

class CommonWidgets extends HomeScreenWidgets {
  ///----- common widget for round picture ----------------------
  circlePhotoWidget(height, width) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(KString.size*Dimens.size10),
          border: Border.all(
            color: KColor.greyColor,
            width: 2,
          )),
      child: ClipRRect(
        borderRadius:  BorderRadius.all(Radius.circular(KString.size*Dimens.size10)),
        child: Image.network(
          'https://c4.wallpaperflare.com/wallpaper/814/716/885/blackpink-lisa-blackpink-k-pop-hd-wallpaper-preview.jpg',
          fit: BoxFit.fill,
          errorBuilder: (BuildContext context, child, stackTrace) {
            return SvgPicture.asset(
                KAssets.userIcon, color: KColor.primaryColor);
          },
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
        ),
      ),
    );
  }

  /// ------------------ Custom Text -------------------------
  customText(text, color, fontFamily) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontFamily: fontFamily,
      ),
    );
  }

  /// ------------------ Card Details of Shooting Screen -------------------------

  rowShootingScreen({change, color1, color2, text1, text2, font1, font2}) {
    return Row(children: [
      change == true
          ? Icon(
        Icons.location_on_outlined,
        color: KColor.buttonColor,
        size: KString.size*Dimens.size4,
      )
          : circlePhotoWidget(KString.size*Dimens.size6, KString.size*Dimens.size6),
      Padding(
        padding: KString.padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonWidgets().customText(text1, color1, font1),
            const Divider(),
            CommonWidgets().customText(text2, color2, font2),
          ],
        ),
      ),
    ]);
  }

  shootingTimeAndExpiration(show) {
    return show == true
        ? Row(
      children: [
        Container(
          height: KString.size*Dimens.size1Point2,
          width: KString.size*Dimens.size4,
          decoration: BoxDecoration(
              color: KColor.primaryColor,
              borderRadius:  BorderRadius.only(
                topRight: Radius.circular(KString.size*Dimens.size1),
                bottomRight: Radius.circular(KString.size*Dimens.size1),
              )),
        ),
        CustomText(
          text: '10:00 am - 11:30am',
          color: KColor.blackColor,
          fontFamily: KFonts.poppinsBold,
        ),
      ],
    )
        : Container(
      height: KString.size*Dimens.size6,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.2),
      ),
      child: Padding(
        padding: KString.padding,
        child: Row(
          children: [
            const Icon(
              Icons.access_time_rounded,
              color: Colors.red,
            ),
            CommonWidgets().commonSizedBox(20.0),
            CustomText(
              text: DateFormat.yMMMEd().format(DateTime.now()),
              color: Colors.red,
              fontFamily: KFonts.poppinsBold,
            ),
          ],
        ),
      ),
    );
  }

  shootingList(change) {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, i) {
            return Column(
              children: [
                CommonWidgets().commonSizedBox(KString.size*Dimens.size1),
                CommonWidgets().shootingTimeAndExpiration(change),
                CommonWidgets().commonSizedBox(KString.size*Dimens.size1),
                Padding(
                  padding: KString.padding,
                  child: Column(
                    children: [
                      Container(
                        height: KString.size*Dimens.size20,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius:  BorderRadius.only(
                            topLeft:  Radius.circular(KString.size*Dimens.size1),
                            topRight: Radius.circular(KString.size*Dimens.size1),
                          ),
                          color: KColor.greyColor.withOpacity(0.05),
                        ),
                        child: Padding(
                          padding: KString.padding,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonWidgets().rowShootingScreen(
                                change: false,
                                color1: KColor.greyColor,
                                color2: KColor.blackColor,
                                font1: KFonts.poppinsRegular,
                                font2: KFonts.poppinsBold,
                                text1: KString.nameOfTheModel,
                                text2: KString.name,
                              ),
                              Container(
                                height: KString.size*Dimens.sizePoint2,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: KColor.greyColor,
                                ),
                              ),
                              CommonWidgets().rowShootingScreen(
                                change: true,
                                color1: KColor.blackColor,
                                color2: KColor.greyColor,
                                font1: KFonts.poppinsBold,
                                font2: KFonts.poppinsRegular,
                                text1: 'Bando chemical industries',
                                text2: 'Room C1 First Floor',
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: KString.size*Dimens.size6,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: KColor.primaryColor,
                          borderRadius:  BorderRadius.only(
                            bottomLeft: Radius.circular(KString.size*Dimens.size1),
                            bottomRight:Radius.circular(KString.size*Dimens.size1),
                          ),
                        ),
                        child: Center(
                          child: CustomText(
                            text: KString.useShootMode,
                            color: KColor.whiteColor,
                            fontFamily: KFonts.poppinsBold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }

  ///--------------------------------- common sized box ---------------------------------------------------
  customSizedBox(height) {
    return SizedBox(height: height);
  }

  ///--------------------------------- common Photo widget ---------------------------------------------------

  commonPhotoWidget(context, image) {
    return Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          child: Image.network(
            image,
            fit: BoxFit.fill,
          ),
        ));
  }

  ///------------------------------- common sized box with height ------------------------------------
  commonSizedBox(height) {
    return SizedBox(height: height);
  }

  ///------------------------------- common sized box with width------------------------------------
  commonSizedBoxWidth(width) {
    return SizedBox(width: width);
  }

  ///------------------------------------------------ Custom AppBar ---------------------------------------------------------

  commonAppBar({context, text, ref, required List<Widget>? actions, pop}) {
    return AppBar(
      centerTitle: true,
      backgroundColor: KColor.whiteColor,
      leading: InkWell(
          onTap: () {
            if (pop == true) {
              Navigator.of(context).pop();
              ref.read(homeControllerProvider.notifier).change(true);
            } else {
              ref.read(dashboardControllerProvider.notifier).setPosition(0);
            }
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          )),
      title: CustomText(
        text: text,
        color: KColor.blackColor,
        fontFamily: KFonts.poppinsMedium,
      ),
      actions: actions!.isEmpty ? [] : actions,
    );


  }

  ///-------------------------------------------- common dual buttons  ---------------------------------------------

  commonDualButtons(context, change, ref, name1, name2, provider) {
    return Container(
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
            HomeScreenWidgets().homeScreenModalButton(
                context, change, ref, name1, provider),
            HomeScreenWidgets().homeScreenKikakuButton(
                context, change, ref, name2, provider),
          ],
        ),
      ),
    );
  }

  image(url) {
    return Image.network(
      url,
      fit: BoxFit.fill,
      errorBuilder: (BuildContext context, child, stackTrace) {
        return SvgPicture.asset(KAssets.userIcon, color: KColor.primaryColor,);
      },
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
    );
  }

  navigate(context, name) {
    return Navigator.of(context, rootNavigator: true).pushNamed(name);
  }

  calendarBoxes(text, color) {
    return Row(
      children: [
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(KString.size*Dimens.size10),
            color: color,
          ),
        ),
        commonSizedBoxWidth(2.0),
        CustomText(
          text: text,
          color: KColor.blackColor,
        )
      ],
    );
  }

  networkWidget(ref, provider) {
    return provider.result == true ? Container() : Container(
      width: double.infinity,
      height: KString.size*Dimens.size5,
      decoration: BoxDecoration(
        color: KColor.darkRedColor,
      ),
      child: Padding(
        padding: KString.padding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.signal_wifi_connected_no_internet_4_outlined,
              color: KColor.whiteColor,),
            CustomText(
              text: 'No Internet connection',
              color: KColor.whiteColor,
              fontFamily: KFonts.poppinsRegular,
            ),

            Material(
              color: KColor.darkRedColor,
              elevation: 10,
              child: TextButton(
                onPressed: () {
                  provider.checkNetwork();
                },
                child: CustomText(
                  text: 'Try again!',
                  color: KColor.whiteColor,
                  fontFamily: KFonts.poppinsRegular,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
