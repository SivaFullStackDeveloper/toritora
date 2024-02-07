

import '../../../../exports.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  static const String routeName = '/profileScreen';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfileScreen> createState() => _ShootingScreenState();
}

class _ShootingScreenState extends ConsumerState<ProfileScreen> {
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
    KString.shootingRequest,
    KString.toritai,
    KString.myFav,
    KString.payments,
    KString.finance,
    KString.toritoraCollege,
  ];

  var profileSettingsText = [
    KString.changeUserName,
    KString.notificationSettings,
    KString.privacyPolicy,
    KString.help,
    KString.feedback,
    KString.logout,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
///---------------------------------------- APP BAR -----------------------------------------------------------
      appBar: CommonWidgets().commonAppBar(text:KString.myPage,ref:ref,actions: []),

      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(KString.size*Dimens.size1Point8),
          child: Column(
            children: [
              Material(
                elevation: 5,
                child: Stack(
                  children: [
                    SizedBox(
                      height: KString.size*Dimens.size12,
                      width: double.infinity,
                      child: Padding(
                        padding: KString.padding,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonWidgets().circlePhotoWidget(KString.size*Dimens.size8,KString.size*Dimens.size8),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: 'Siva rama krishna',
                                  color: KColor.blackColor,
                                  fontFamily: KFonts.poppinsBold,
                                ),
                                CustomText(
                                  text: 'User Name Here',
                                  color: KColor.greyColor,
                                  fontFamily: KFonts.poppinsRegular,
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: KString.size*Dimens.size4,
                                width: KString.size*Dimens.size8,
                                decoration: BoxDecoration(
                                  color: KColor.buttonColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(KString.size*Dimens.size1)),
                                ),
                                child: Center(
                                  child: CustomText(
                                    text: 'View',
                                    color: KColor.whiteColor,
                                    fontFamily: KFonts.poppinsBold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      top: 20,
                      left: 8,
                      duration: const Duration(seconds: 2),
                      child: SizedBox(
                        height: KString.size*Dimens.size8,
                        width: KString.size*Dimens.size8,
                        child: CircularProgressIndicator(
                          value: 0.8,
                          color: KColor.primaryColor,
                        ),
                      ),
                    ),
                    Positioned(
                        top: KString.size*Dimens.size9,
                        left: KString.size*Dimens.sizePoint6,
                        child: Container(
                          height: KString.size*Dimens.size3,
                          width: KString.size*Dimens.size10,
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
                                    fontSize: KString.size*Dimens.sizePoint8,
                                    color: KColor.whiteColor,
                                    fontFamily: KFonts.poppinsRegular,
                                  ))
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              CommonWidgets().commonSizedBox(KString.size*Dimens.sizePoint8),
              GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 3 / 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: 6,
                  itemBuilder: (BuildContext ctx, index) {
                    return Material(
                      elevation: 6,
                      child: Padding(
                        padding:  EdgeInsets.all(KString.size*Dimens.size1Point6),
                        child: Center(
                          child: ProfileContainer(
                            icon: profileItemIcons[index],
                            text: profileItemText[index],
                          ),
                        ),
                      ),
                    );
                  }),
             CommonWidgets().commonSizedBox(KString.size*Dimens.size1),
              Expanded(
                child: Material(
                  elevation: 0,
                  child: ListView.builder(
                      itemCount: 6,
                      itemBuilder: (context, i) {
                        return Padding(
                          padding:  EdgeInsets.all(KString.size*Dimens.size1Point2),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        profileSettingsIcons[i],
                                        width: KString.size*Dimens.size2,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: KString.size*Dimens.size2Point8),
                                        child: CustomText(
                                            text: profileSettingsText[i],
                                            color: KColor.blackColor,
                                            fontFamily:
                                                KFonts.poppinsMedium),
                                      ),
                                    ],
                                  ),
                                  i == 5
                                      ? const SizedBox()
                                      : Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: KColor.greyColor,
                                        )
                                ],
                              )
                            ],
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
