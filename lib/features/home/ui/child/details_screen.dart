


import '../../../../exports.dart';

class DetailsScreen extends ConsumerStatefulWidget {
  static const String routeName = '/detailsScreen';
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends ConsumerState<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var change = ref.watch(homeControllerProvider);

    return Scaffold(
      appBar: CommonWidgets().commonAppBar(
        context: context,
        text: KString.modelDetails,
        ref: ref,
        actions: [
          InkWell(
            onTap: () {},
            child: SvgPicture.asset(KAssets.star),
          )
        ],
        pop: true,
      ),
      body: SafeArea(
          child: Padding(
        padding:  const EdgeInsets.only(top: 8.0, left: 18.0, right: 18.0),
        child: Column(
          children: [
            ///-------------------------------------------------- profile and public calendar buttons ----------------------------------
            CommonWidgets().commonDualButtons(context, change, ref,
                KString.profile, KString.calendar, homeControllerProvider),
            CommonWidgets().commonSizedBox(20.0),

            ///------------------------------------------------ Image of the profile details  ----------------------------------

            change==true? const ProfileView():const PublicCalendar(),
///------------------------------------------------Toritai or book now   ----------------------------------

           SizedBox(
             height:50,
             width:double.infinity,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 Container(
                   height:40,
                   width:100,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(6),
                     border: Border.all(
                       width: 1,
                       color: KColor.greyColor.withOpacity(0.3),
                     ),
                   ),
                   child: Center(
                     child: CustomText(
                       text: 'Toritai',
                       color: KColor.primaryColor,
                       fontFamily: KFonts.poppinsBold,
                     ),
                   ),
                 ),
                 Container(
                   height:40,
                   width:100,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(6),
                     border: Border.all(
                       width: 1,
                       color: KColor.greyColor.withOpacity(0.3),
                     ),
                   ),
                   child: Center(
                     child: CustomText(
                       text: 'Book Now',
                       color: KColor.primaryColor,
                       fontFamily: KFonts.poppinsBold,
                     ),
                   ),
                 ),
               ],
             ),
           )
          ],
        ),
      )),
    );
  }
}
