import 'dart:async';

import '../../../../exports.dart';

class ModelView extends ConsumerStatefulWidget {
  const ModelView({Key? key}) : super(key: key);

  @override
  ConsumerState<ModelView> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<ModelView>
    with TickerProviderStateMixin {
  Timer? _timer;
  AnimationController? _controller;
  Animation<double>? _animation;
  int sliderChange = 0;

  static const _images = [
    'https://media.istockphoto.com/id/1393619720/photo/portrait-of-young-asian-woman-in-street-fashion-on-pink-background.jpg?b=1&s=170667a&w=0&k=20&c=vuJjQZRFc0p6CEYR4h0AMtOOlG1Foup5UmQ-N_90L00=',
    'https://static.toiimg.com/thumb/msid-89895182,width-1070,height-580,imgsize-95360,resizemode-75,overlay-toi_sw,pt-32,y_pad-40/photo.jpg',
    'https://www.themarysue.com/wp-content/uploads/2022/08/BLACKPINK-K-Pop-Group-Jisoo-Jennie-Rose%CC%81-Lisa-Brand-Ambassadors.jpg?fit=1200%2C630',
    'https://c4.wallpaperflare.com/wallpaper/814/716/885/blackpink-lisa-blackpink-k-pop-hd-wallpaper-preview.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (sliderChange < 4) {
        setState(() {
          sliderChange++;
        });
      } else if (sliderChange == 4) {
        setState(() {
          sliderChange = 0;
        });
      }
    });
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(parent: _controller!, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    _controller!.dispose();
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///---------------------------- carousel slider ------------------------------------------
                Stack(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: KString.size*Dimens.size16,
                        aspectRatio: 4 / 9,
                        viewportFraction: 1.0,
                        initialPage: 0,
                      ),
                      items: _images.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: double.infinity,
                                margin: EdgeInsets.symmetric(horizontal: KString.size*Dimens.sizePoint8),
                                decoration:  BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(KString.size*Dimens.sizePoint8)),
                                ),
                                child: ClipRRect(
                                  borderRadius:  BorderRadius.all(
                                    Radius.circular(KString.size*Dimens.sizePoint8),
                                  ),
                                  child:CommonWidgets().image(_images[
                                  sliderChange == 4 ? 0 : sliderChange],
                                 )));
                          },
                        );
                      }).toList(),
                    ),
                    Positioned(
                      top: KString.size*Dimens.size1,
                      left: KString.size*Dimens.size30,
                      child: Container(
                        height: KString.size*Dimens.size2,
                        width: KString.size*Dimens.size5,
                        decoration: BoxDecoration(
                          color: KColor.blackColor.withOpacity(0.5),
                          borderRadius: BorderRadius.all(Radius.circular(KString.size*Dimens.sizePoint8)),
                        ),
                        child: Center(
                          child: CustomText(
                            text: '$sliderChange' == '4'
                                ? '0/3'
                                : '$sliderChange/3',
                            color: KColor.whiteColor,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom:KString.size*Dimens.size1,
                        right:  KString.size*Dimens.size28,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: '  Black Pink',
                              color: KColor.whiteColor,
                              fontFamily: KFonts.poppinsBold,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  size: KString.size*Dimens.size3,
                                  color: KColor.whiteColor,
                                ),
                                CustomText(
                                  text: 'Minami',
                                  color: KColor.whiteColor,
                                  fontFamily: KFonts.poppinsMedium,
                                ),
                              ],
                            )
                          ],
                        )),
                    Positioned(
                        bottom:KString.size*Dimens.size1,
                        left:   KString.size*Dimens.size24,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText2(
                              text: KString.modelling,
                              color: KColor.whiteColor.withOpacity(0.5),
                              fontFamily: KFonts.poppinsBold,
                            ),
                          ],
                        )),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: DotsIndicator(
                        dotsCount: _images.length,
                        position: sliderChange == 4 ? 0 : sliderChange,
                        decorator: DotsDecorator(
                          activeColor: KColor.primaryColor,
                          size:  Size.square(KString.size*Dimens.size1),
                          activeSize:  Size(KString.size*Dimens.size1Point8, KString.size*Dimens.size1),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(KString.size*Dimens.sizePoint8)),
                        ),
                      ),
                    ),
                  ],
                ),

                CommonWidgets().commonSizedBox(KString.size*Dimens.size1),

                /// ---------------------  New models text ------------------------------------------------------------
                DualTextBar(
                  text: KString.newModels,
                ),

                /// ---------------------  CustomListWithTag ------------------------------------------------------------

                InkWell(
                  onTap: () {
                    CommonWidgets().navigate(context,DetailsScreen.routeName);
                  },
                  child: CustomListWithTag(
                    show: true,
                  ),
                ),

                /// ---------------------  available This Week text ------------------------------------------------------------
                CommonWidgets().commonSizedBox(KString.size*Dimens.size1),
                DualTextBar(
                  text: KString.availableThisWeek,
                ),

                CustomListWithTag(show: true, item: 2),

                /// --------------------- experience Models text ------------------------------------------------------------
                CommonWidgets().commonSizedBox(KString.size*Dimens.size2),
                DualTextBar(
                  text: KString.experienceModels,
                ),

                CustomListWithTag(
                  show: false,
                ),

                /// --------------------- toritora Fav text ------------------------------------------------------------
                CommonWidgets().commonSizedBox(KString.size*Dimens.size2),
                DualTextBar(
                  text: KString.toritoraFav,
                ),

                CustomListWithTag(
                  show: false,
                ),
              ],
            );
            //container
          }),
    );
  }
}
