import 'dart:async';

import '../../../../exports.dart';

///-------------------------------  Home screen List and search  List  ----------------------------------------------------

class CustomListWithTag extends ConsumerStatefulWidget {
  var show;
  var item;

  CustomListWithTag({Key? key, this.show, this.item}) : super(key: key);

  @override
  ConsumerState<CustomListWithTag> createState() => _CustomListWithTagState();
}

class _CustomListWithTagState extends ConsumerState<CustomListWithTag> {
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: KString.size*Dimens.size24,
      width: double.infinity,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, i) {
            return Padding(
              padding:EdgeInsets.all( KString.size*Dimens.sizePoint6),
              child:Stack(
                children: [
                  Material(
                    borderRadius: BorderRadius.circular( KString.size*Dimens.sizePoint6),
                    elevation:  KString.size*Dimens.size2,
                    child: Container(
                      height: KString.size*Dimens.size22,
                      width: KString.size*Dimens.size14,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(KString.size*Dimens.sizePoint6),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ///-------------------------  Image of the profile -----------------------------------------------------
                          Padding(
                            padding:  EdgeInsets.only(
                                top: KString.size*Dimens.sizePoint8,
                                left:  KString.size*Dimens.sizePoint8,
                                right:  KString.size*Dimens.sizePoint8,
                                bottom: 0.0),
                            child: SizedBox(
                                height: KString.size*Dimens.size14,
                                width: 148,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(KString.size*Dimens.sizePoint6),
                                  child: CommonWidgets().image(
                                    'https://media.istockphoto.com/id/1393619720/photo/portrait-of-young-asian-woman-in-street-fashion-on-pink-background.jpg?b=1&s=170667a&w=0&k=20&c=vuJjQZRFc0p6CEYR4h0AMtOOlG1Foup5UmQ-N_90L00=',
                                  ),
                                )),
                          ),

                          ///-------------------------  Name of the profile -----------------------------------------------------
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomText(
                              text: KString.name
                                  .replaceRange(12, KString.name.length, '...'),
                              color: KColor.blackColor,
                              fontFamily: KFonts.poppinsMedium,
                            ),
                          ),

                          ///-------------------------  Name of the profile city and View button -----------------------------------------------------

                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      color: KColor.greyColor,
                                      size: 20,
                                    ),
                                    Text('Tokyo',
                                        style: TextStyle(
                                          color: KColor.greyColor,
                                          fontSize: 12,
                                          fontFamily: KFonts.poppinsRegular,
                                        )),
                                  ],
                                ),
                                Text('View',
                                    style: TextStyle(
                                      color: KColor.buttonColor,
                                      fontSize: 14,
                                      fontFamily: KFonts.poppinsRegular,
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  ///-------------------------  profile New Banner -----------------------------------------------------

                  widget.show == true
                      ? Positioned(
                          top: 8,
                          left: 8,
                          child: Container(
                            height: 18,
                            width: 64,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: widget.item == 2
                                  ? KColor.greenColor
                                  : KColor.primaryColor,
                            ),
                            child: Center(
                              child: CustomText(
                                text: widget.item == 2
                                    ? KString.available
                                    : KString.newString,
                                color: KColor.whiteColor,
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            );
          }),
    );
  }
}

///-------------------------------  Home screen List Kiaku   ----------------------------------------------------

class KikakuView extends ConsumerStatefulWidget {
  const KikakuView({Key? key}) : super(key: key);

  @override
  ConsumerState<KikakuView> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<KikakuView>
    with TickerProviderStateMixin {
  Timer? _timer;
  AnimationController? _controller;
  Animation<double>? _animation;
  int sliderChange = 0;

  static const _images = [
    'https://resize.indiatvnews.com/en/resize/newbucket/1200_-/2022/06/bts-7-1655449932.jpg',
    'https://www.rollingstone.com/wp-content/uploads/2021/05/R1352_FEA_BTS_A_Opener.jpg?w=831&h=554&crop=1',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgcecNB2UyOxAtCq4c3qix9PrMM3zTRshdNT_Jk3lq4g&usqp=CAU&ec=48665699',
    'https://imageio.forbes.com/specials-images/imageserve/637514c1fbf5b1d3d3f59b8f/64th-Annual-GRAMMY-Awards---Arrivals/960x0.jpg?format=jpg&width=960',
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
              children: [
                ///----------- carousel slider --------------------------
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
                                  )
                                ));
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
                        right:  KString.size*Dimens.size16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(width: 10),
                            CustomText(
                              text: '  Traditional photoshoot',
                              color: KColor.whiteColor,
                              fontFamily: KFonts.poppinsBold,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  size: 30,
                                  color: KColor.whiteColor,
                                ),
                                CustomText(
                                  text: 'Tokyo',
                                  color: KColor.whiteColor,
                                  fontFamily: KFonts.poppinsMedium,
                                ),
                              ],
                            )
                          ],
                        )),
                    Positioned(
                        bottom:KString.size*Dimens.size1,
                        left:   KString.size*Dimens.size20,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextForKikaku(
                              text: KString.photography,
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

                DualTextBar(
                  text: KString.popularEvents,
                ),

                CustomListWithTag(
                  show: true,
                ),
                CommonWidgets().commonSizedBox(KString.size*Dimens.size1),
                DualTextBar(
                  text: KString.miniSessions,
                ),
                CustomListWithTag(
                  show: true,
                ),
                CommonWidgets().commonSizedBox(KString.size*Dimens.size1),
                DualTextBar(
                  text: KString.toritoraEvents,
                ),
                CustomListWithTag(
                  show: true,
                ),
              ],
            );
            //container
          }),
    );
  }
}

///-------------------------------  search List ----------------------------------------------------

class CustomListWithTagForSearch extends StatefulWidget {
  var show;
  var item;

  CustomListWithTagForSearch({Key? key, this.show, this.item})
      : super(key: key);

  @override
  State<CustomListWithTagForSearch> createState() =>
      _CustomListWithTagForSearchState();
}

class _CustomListWithTagForSearchState
    extends State<CustomListWithTagForSearch> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 4.5,
          ),
          itemCount: 6,
          itemBuilder: (BuildContext ctx, index) {
            return Stack(
              children: [
                Material(
                  borderRadius: BorderRadius.circular( KString.size*Dimens.sizePoint5,),
                  elevation: 2,
                  child: Container(
                    height: 220,
                    width: 148,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(KString.size*Dimens.sizePoint5,),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 8.0, right: 8.0, bottom: 0.0),
                          child: SizedBox(
                              height: 150,
                              width: 148,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.network(
                                    'https://media.istockphoto.com/id/1393619720/photo/portrait-of-young-asian-woman-in-street-fashion-on-pink-background.jpg?b=1&s=170667a&w=0&k=20&c=vuJjQZRFc0p6CEYR4h0AMtOOlG1Foup5UmQ-N_90L00=',
                                    cacheHeight: 150,
                                    cacheWidth: 148,
                                  ))),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomText(
                            text: KString.name
                                .replaceRange(12, KString.name.length, '...'),
                            color: KColor.blackColor,
                            fontFamily: KFonts.poppinsMedium,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    color: KColor.greyColor,
                                    size: 20,
                                  ),
                                  Text('Tokyo',
                                      style: TextStyle(
                                        color: KColor.greyColor,
                                        fontSize: 12,
                                        fontFamily: KFonts.poppinsRegular,
                                      )),
                                ],
                              ),
                              Text(KString.view,
                                  style: TextStyle(
                                    color: KColor.buttonColor,
                                    fontSize: 14,
                                    fontFamily: KFonts.poppinsRegular,
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                widget.show == true
                    ? Positioned(
                        top: 15,
                        left: 8,
                        child: Container(
                          height: 18,
                          width: 64,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: widget.item == 2
                                ? KColor.greenColor
                                : KColor.primaryColor,
                          ),
                          child: Center(
                            child: CustomText(
                              text: widget.item == 2
                                  ? KString.available
                                  : KString.newString,
                              color: KColor.whiteColor,
                            ),
                          ),
                        ),
                      )
                    : SizedBox(),
              ],
            );
          }),
    );
  }
}
