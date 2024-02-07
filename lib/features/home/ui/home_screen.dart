import 'dart:async';

import '../../../../exports.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const String routeName = '/homeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
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
    var change = ref.watch(homeControllerProvider);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding:  EdgeInsets.only(top: KString.size*Dimens.sizePoint8,
            left: KString.size*Dimens.size1Point8,
            right: KString.size*Dimens.size1Point8),
        child: Column(
          children: [
            ///-------------- APP BAR ------------------
            CommonWidgets().homeScreenAppBar(context),
            CommonWidgets().customSizedBox(KString.size*Dimens.size1),

            ///------------ Search Bar and filter icon --------------------------
            CommonWidgets().homeScreenSearchBar(context),

            CommonWidgets().customSizedBox(KString.size*Dimens.size1),

            ///------------------- Model or Kikaku /  satueikai buttons ---------------------------------
            CommonWidgets().commonDualButtons(
              context,change,ref,KString.model,KString.kikakuSatueikai,
                homeControllerProvider
            ),
            CommonWidgets().customSizedBox(KString.size*Dimens.size1),
            ///----------------------- Model View and kikaku view buttons --------------------------------------
            change == true ? const ModelView() : const KikakuView(),
          ],
        ),
      )),
    );
  }
}
