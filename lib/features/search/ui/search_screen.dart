import '../../../../exports.dart';

class SearchScreen extends ConsumerStatefulWidget {
  static const String routeName = '/searchScreen';
  const SearchScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets().commonAppBar(
        pop:true,
          context:context,
          text:KString.search,
          ref:ref,
          actions: [
        Icon(
          Icons.more_vert,
          color: KColor.primaryColor,
        ),
      ]),


      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///------------ Search Bar --------------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: KString.size*Dimens.size6,
                      width: KString.size*Dimens.size30,
                      decoration: BoxDecoration(
                        color: KColor.greyColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(KString.size*Dimens.sizePoint6),
                      ),
                      child: TextField(
                        cursorColor: KColor.primaryColor,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: KString.searchHere,
                          suffixIcon: Icon(
                            Icons.search,
                            color: KColor.greyColor,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(KString.size*Dimens.sizePoint6),
                              borderSide: BorderSide(
                                  color: KColor.primaryColor,
                                  width: 2.0)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(KString.size*Dimens.sizePoint6),
                              borderSide: BorderSide(
                                  color: KColor.transparentColor,
                                  width: 2.0)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(KString.size*Dimens.sizePoint6),
                              borderSide: BorderSide(
                                  color: KColor.transparentColor,
                                  width: 2.0)),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      HomeBottomSheet().openSheet(context);
                    },
                    child: Container(
                      height: KString.size*Dimens.size6,
                      width: KString.size*Dimens.size6,
                      decoration:  BoxDecoration(
                        color: KColor.primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(KString.size*Dimens.sizePoint6)),
                      ),
                      child: Center(
                          child: SvgPicture.asset(KAssets.filter)),
                    ),
                  ),
                ],
              ),

              CommonWidgets().commonSizedBox(KString.size*Dimens.size2),
              CustomText(
                text: KString.resultsFound,
                color: KColor.blackColor,
                fontFamily: KFonts.poppinsBold,
              ),
              CommonWidgets().commonSizedBox(KString.size*Dimens.size2),

              CustomListWithTagForSearch(
                show: true,
              ),
            ],
          ),
        ),
      ),
    );

  }
}
