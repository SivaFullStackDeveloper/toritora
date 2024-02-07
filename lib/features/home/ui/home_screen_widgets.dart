import '../../../../exports.dart';

class HomeScreenWidgets {
  ///------------------------- Home screen App Bar --------------------------------------

  homeScreenAppBar(context) {
    return Padding(
      padding: KString.padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(KAssets.toritora),
          Row(
            children: [
              InkWell(
                onTap: () => CommonWidgets()
                    .navigate(context, NotificationScreen.routeName),
                child: Badge(
                  backgroundColor: KColor.buttonColor,
                  label: const Text("3"),
                  child: Icon(Icons.notifications, color: KColor.primaryColor),
                ),
              ),
              CommonWidgets().commonSizedBoxWidth(KString.size*Dimens.size1),
              InkWell(
                onTap: () =>
                    CommonWidgets().navigate(context, ChatScreen.routeName),
                child: Badge(
                  backgroundColor: KColor.buttonColor,
                  label: const Text("3"),
                  child: Icon(
                    Icons.chat,
                    color: KColor.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// ------------------------ Home screen search bar and filter icon ----------------------
  homeScreenSearchBar(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () =>
              CommonWidgets().navigate(context, SearchScreen.routeName),
          child: Container(
            height: KString.size*Dimens.size6,
            width: KString.size*Dimens.size30,
            decoration: BoxDecoration(
              color: KColor.greyColor.withOpacity(0.2),
              borderRadius:  BorderRadius.all(Radius.circular(KString.size*Dimens.sizePoint8)),
            ),
            child: Padding(
              padding:  EdgeInsets.only(
                  top: KString.size*Dimens.sizePoint8,
                  bottom:KString.size*Dimens.sizePoint5,
                  left: KString.size*Dimens.size1Point8,
                  right: KString.size*Dimens.size1Point8),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: KString.searchHere,
                      color: KColor.greyColor,
                      fontFamily: KFonts.poppinsRegular,
                    ),
                    SvgPicture.asset(KAssets.search),
                  ]),
            ),
          ),
        ),

        /// -----------------------filter Bottom sheet ----------------------------------------
        InkWell(
          onTap: () {
            HomeBottomSheet().openSheet(context);
          },
          child: Container(
            height: KString.size*Dimens.size6,
            width: KString.size*Dimens.size6,
            decoration:  BoxDecoration(
              color: KColor.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(KString.size*Dimens.sizePoint8)),
            ),
            child: Center(child: SvgPicture.asset(KAssets.filter)),
          ),
        ),
      ],
    );
  }

  ///--------------------------- Model button -----------------------------------------------------------

  homeScreenModalButton(context, change, ref, name, provider) {
    return InkWell(
      onTap: () {
        ref.read(provider.notifier).change(true);
      },
      child: Container(
        height: KString.size*Dimens.size7,
        width: MediaQuery.of(context).size.width / 2.5,
        decoration: BoxDecoration(
          color: change == true ? KColor.buttonColor : KColor.transparentColor,
          borderRadius:  BorderRadius.all(Radius.circular(KString.size*Dimens.sizePoint6)),
        ),
        child: Center( 
          child: Text(
            name,
            style: TextStyle(
                color: change == true ? KColor.whiteColor : KColor.blackColor,
                fontFamily: KFonts.poppinsBold,
                fontSize: KString.size*Dimens.size1Point4),
          ),
        ),
      ),
    );
  }

  ///------------------------------ Kikaku / Satueikai  button -------------------------------------------

  homeScreenKikakuButton(context, change, ref, name, provider) {
    return InkWell(
      onTap: () {
        ref.read(provider.notifier).change(false);
      },
      child: Container(
        height: KString.size*Dimens.size7,
        width: MediaQuery.of(context).size.width / 2.5,
        decoration: BoxDecoration(
          color: change == false ? KColor.buttonColor : KColor.transparentColor,
          borderRadius:  BorderRadius.all(Radius.circular(KString.size*Dimens.sizePoint6)),
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
                color: change == false ? KColor.whiteColor : KColor.blackColor,
                fontFamily: KFonts.poppinsBold,
                fontSize: KString.size*Dimens.size1Point4),
          ),
        ),
      ),
    );
  }

  badgeNameAndEmail() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
        height: 40,
        width: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(KString.size*Dimens.size3Point2),
          color: KColor.badgeColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(
              KAssets.badge,
            ),
            Text('Badge Name',
                style: TextStyle(
                  fontSize: KString.size*Dimens.size1Point2,
                  color: KColor.whiteColor,
                  fontFamily: KFonts.poppinsRegular,
                )),
          ],
        ),
      ),
      Column(
        children: [
          CustomText(
            text: KString.name,
            color: KColor.blackColor,
            fontFamily: KFonts.poppinsBold,
          ),
          CustomText(
            text: 'siva@gmail.com',
            color: KColor.buttonColor,
            fontFamily: KFonts.poppinsBold,
          ),
        ],
      ),
    ]);
  }

  approvedTime() {
    return Padding(
      padding:  EdgeInsets.all(KString.size*Dimens.sizePoint4),
      child: Material(
        elevation: KString.size*Dimens.sizePoint6,
        child: SizedBox(
          height: KString.size*Dimens.size6,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: KString.padding,
                child: Row(
                  children: [
                    CustomText(
                      text: 'Shooting mode\nFrequency',
                      color: KColor.greyColor,
                      fontFamily: KFonts.poppinsRegular,
                    ),
                    CommonWidgets().commonSizedBoxWidth(KString.size*Dimens.sizePoint2),
                    Text(
                      '89%',
                      style: TextStyle(
                        color: KColor.primaryColor,
                        fontFamily: KFonts.poppinsBold,
                        fontSize: KString.size*Dimens.size1Point8,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: List.generate(
                    150 ~/ 10,
                    (index) => Expanded(
                          child: Container(
                            color: index % 2 == 0
                                ? Colors.transparent
                                : KColor.greyColor,
                            height: 2,
                            width: 2,
                          ),
                        )),
              ),
              Padding(
                padding: KString.padding,
                child: Row(
                  children: [
                    Container(
                      constraints:  BoxConstraints(
                        maxHeight: KString.size*Dimens.size4,
                        maxWidth: KString.size*Dimens.size20,
                      ),
                      child: CustomText(
                        text: 'Approved time',
                        color: KColor.greyColor,
                        fontFamily: KFonts.poppinsRegular,
                      ),
                    ),
                    CommonWidgets().commonSizedBoxWidth(KString.size*Dimens.sizePoint2),
                    Text(
                      '24h',
                      style: TextStyle(
                        color: KColor.primaryColor,
                        fontFamily: KFonts.poppinsBold,
                        fontSize: KString.size*Dimens.size1Point8,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  aboutUser() {
    return Padding(
      padding: KString.padding,
      child: Material(
          elevation: KString.size*Dimens.sizePoint6,
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: userAbout.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding:  EdgeInsets.all(KString.size*Dimens.size1Point8),
                  child: Column(
                    children: [
                      DualTextBar3(
                        text: userAbout[i],
                        text2: 'hellow world',
                      ),
                    ],
                  ),
                );
              })),
    );
  }

  var userAbout = [
    'Self introduction',
    'Active Regions',
    'Height',
    'Modelling Exp',
    'Speciality Genres',
    'Awards',
    'Others',
    'Price Per Hour',
    'Why did you\n become model:',
    'Twitter',
    'Instagram',
  ];
}
