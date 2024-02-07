import 'dart:async';
import '../../../../exports.dart';






class FilterBottomSheet extends ConsumerStatefulWidget {
  const FilterBottomSheet({Key? key}) : super(key: key);

  @override
  ConsumerState<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends ConsumerState<FilterBottomSheet> {

  TextEditingController controller = TextEditingController();
  double start = 1.0;
  double end = 20.0;
  var profileItemText = [
    KString.pretty,
    KString.cute,
    KString.natural,
    KString.art,
    KString.clean,
    KString.cool,
    KString.dark,
    KString.others,
  ];

  String dropDownValue = 'Choose up to 3';


  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var filterController = ref.watch(filterControllerProvider);
      filterController.addList();
    });

  }

  @override
  Widget build(BuildContext context) {
    var filterController = ref.watch(filterControllerProvider);
    return Padding(
      padding:  EdgeInsets.only(left: KString.size*Dimens.size1Point8,
          right: KString.size*Dimens.size1Point8),
      child: SizedBox(
        height: 580,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             CommonWidgets().commonSizedBox(KString.size*Dimens.size1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: KString.size*Dimens.sizePoint6,
                    width: KString.size*Dimens.size4,
                    decoration: BoxDecoration(
                      color: KColor.greyColor.withOpacity(0.4),
                      borderRadius:  BorderRadius.all(Radius.circular(KString.size*Dimens.size1)),
                    ),
                  ),
                ],
              ),
              CommonWidgets().commonSizedBox(KString.size*Dimens.size1),
              DualTextBar2(text1: KString.searchFilters, text2: KString.close),
              CommonWidgets().commonSizedBox(KString.size*Dimens.size2),
              CustomText(
                text: KString.shootingArea,
                color: KColor.blackColor,
                fontFamily: KFonts.poppinsRegular,
              ),
              CommonWidgets().commonSizedBox(KString.size*Dimens.size2),
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return ShowCitiesList();
                      });
                },
                child: Container(
                  height:KString.size*Dimens.size6,
                  decoration: BoxDecoration(
                      borderRadius:  BorderRadius.all(Radius.circular(KString.size*Dimens.size1)),
                      border: Border.all(
                        color: KColor.primaryColor,
                        width:KString.size*Dimens.sizePoint2,
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:KString.padding,
                        child: SvgPicture.asset(KAssets.area,
                            width: KString.size*Dimens.size2, height: KString.size*Dimens.size2),
                      ),
                      CustomText(
                        text: filterController.selected.isEmpty
                            ? "Choose up to 3"
                            : filterController.selected.join(',').toString(),
                        color: KColor.blackColor,
                        fontFamily: KFonts.poppinsRegular,
                      ),
                      CommonWidgets().commonSizedBox(KString.size*Dimens.size2),
                      Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: KColor.greyColor,
                      ),

                    ],
                  ),
                ),
              ),
              CommonWidgets().commonSizedBox(KString.size*Dimens.size2),
              CustomText(
                text: KString.shootingDate,
                color: KColor.blackColor,
                fontFamily: KFonts.poppinsRegular,
              ),
              CommonWidgets().commonSizedBox(KString.size*Dimens.size2),
              InkWell(
                onTap: () => _selectDate(context, ref),
                child: Container(
                  height: KString.size*Dimens.size6,
                  decoration: BoxDecoration(
                      borderRadius:  BorderRadius.all(Radius.circular(KString.size*Dimens.size1)),
                      border: Border.all(
                        color: KColor.primaryColor,
                        width: KString.size*Dimens.sizePoint2,
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: KString.padding,
                        child: SvgPicture.asset(KAssets.calendarDrop,
                            width:KString.size*Dimens.size2,
                            height: KString.size*Dimens.size2),
                      ),
                      CommonWidgets().commonSizedBox(KString.size*Dimens.size2),
                      Padding(
                        padding: KString.padding,
                        child: CustomText(
                          text: KString.selectDate,
                          color: KColor.blackColor,
                          fontFamily: KFonts.poppinsRegular,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CommonWidgets().commonSizedBox(KString.size*Dimens.size2),
              CustomText(
                text: KString.selectGenre,
                color: KColor.blackColor,
                fontFamily: KFonts.poppinsMedium,
              ),
              GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 3 / 1.8,
                  ),
                  itemCount: 8,
                  itemBuilder: (BuildContext ctx, index) {
                    return InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () => ref
                          .read(filterControllerProvider)
                          .genreFunction(profileItemText[index]),
                      child: Card(
                        color: filterController.filterItemList
                                .contains(profileItemText[index].toString())
                            ? KColor.lightButtonColor
                            : KColor.whiteColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(KString.size*Dimens.size1)),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(KString.size*Dimens.sizePoint6)),
                              child: Padding(
                                padding: KString.padding,
                                child: Center(
                                  child: FilterContainer(
                                    text: profileItemText[index],
                                    color: ref
                                            .watch(filterControllerProvider
                                                .notifier)
                                            .filterItemList
                                            .contains(profileItemText[index]
                                                .toString())
                                        ? KColor.whiteColor
                                        : KColor.blackColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
              CommonWidgets().commonSizedBox(KString.size*Dimens.size2),
              CustomText(
                text: KString.modellingExperinece,
                color: KColor.blackColor,
                fontFamily: KFonts.poppinsMedium,
              ),
              CommonWidgets().commonSizedBox(KString.size*Dimens.size2),
              SliderTheme(
                data: SliderThemeData(
                  showValueIndicator: ShowValueIndicator.always,
                  thumbColor: KColor.whiteColor,
                  disabledThumbColor: KColor.whiteColor,
                ),
                child: RangeSlider(
                  activeColor: KColor.lightButtonColor,
                  inactiveColor: KColor.greyColor,
                  values:
                      RangeValues(filterController.start, filterController.end),
                  labels: RangeLabels(
                      '${filterController.start.toStringAsFixed(0)} years',
                      '${filterController.end.toStringAsFixed(0)} years'),
                  onChanged: (value) {
                    filterController.updateRange(value.start);

                    filterController.updateEnd(value.end);
                  },
                  min: 1.0,
                  max: 20.0,
                ),
              ),
              CommonWidgets().commonSizedBox(KString.size*Dimens.size2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: KString.size*Dimens.size5,
                      width: KString.size*Dimens.size26,
                      decoration: BoxDecoration(
                        color: KColor.primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(KString.size*Dimens.size1)),
                      ),
                      child: Center(
                        child: CustomText(
                          text: KString.showResults,
                          color: KColor.whiteColor,
                          fontFamily: KFonts.poppinsMedium,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: ()=>filterController.clear(),
                    child: Padding(
                      padding: KString.padding,
                      child: CustomText(
                        text: KString.clear,
                        color: KColor.blackColor,
                        fontFamily: KFonts.poppinsMedium,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, ref) async {
    final DateTime? picked = await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: KColor.primaryColor,
                onPrimary: KColor.whiteColor,
                onSurface: KColor.blackColor,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: KColor.primaryColor, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: ref.read(filterControllerProvider).selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null &&
        picked != ref.read(filterControllerProvider).selectedDate) {
      ref.read(filterControllerProvider).changeDate(picked);
    }
  }
}

///--------------------------------------- show cities function starts here ---------------------------

class HomeBottomSheet {
  openSheet(context) {
    return showModalBottomSheet<void>(
      isScrollControlled: true,
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(KString.size*Dimens.size1Point6), topRight: Radius.circular(KString.size*Dimens.size1Point6)),
      ),
      context: context,
      builder: (BuildContext context) {
        return const FilterBottomSheet();
      },
    );
  }
}

class ShowCitiesList extends ConsumerWidget {
  ShowCitiesList({Key? key}) : super(key: key);
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var filterController = ref.watch(filterControllerProvider);
    return Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: KString.padding,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 700,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(KString.size*Dimens.size1Point5),
                color: KColor.whiteColor,
              ),
              padding:  EdgeInsets.all(KString.size*Dimens.size1Point8),
              child: Column(
                children: [
                  DualTextBar2(text1: KString.searchCity, text2: KString.close),
                  CommonWidgets().commonSizedBox(KString.size*Dimens.size2),
                  CustomText(
                    text: filterController.selected.length == 3
                        ? 'You Have Selected 3 Areas!!!'
                        : '',
                    color: KColor.darkRedColor,
                    fontFamily: KFonts.poppinsBold,
                  ),
                  CommonWidgets().commonSizedBox(KString.size*Dimens.size2),
                  Padding(
                    padding: KString.padding,
                    child: Container(
                      height: KString.size*Dimens.size6,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: KColor.greyColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(KString.size*Dimens.size1),
                      ),
                      child: TextFormField(
                        onChanged: (value){
                          if(controller.text.isEmpty){
                            filterController.addList();
                          }else{
                            filterController.searchCity(controller.text);
                            print(controller.text);
                          }

                        },
                        controller: controller,
                        cursorColor: KColor.primaryColor,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: KString.searchCity,
                          suffixIcon: Icon(
                            Icons.search,
                            color: KColor.greyColor,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(KString.size*Dimens.size1),
                              borderSide: BorderSide(
                                  color: KColor.primaryColor, width: KString.size*Dimens.sizePoint2)),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(KString.size*Dimens.size1),
                              borderSide: BorderSide(
                                  color: KColor.transparentColor, width: KString.size*Dimens.sizePoint2)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(KString.size*Dimens.size1),
                              borderSide: BorderSide(
                                  color: KColor.transparentColor, width:KString.size*Dimens.sizePoint2)),
                        ),
                      ),
                    ),
                  ),
                  filterController.filterItemList.toString()=='[]'?Padding(
                    padding: KString.padding,
                    child: Center(
                      child: Text('"${controller.text}"  this city is not available'),
                    ),
                  ):const SizedBox(),

                  Expanded(
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: filterController.filterItemList.length,
                        itemBuilder: (context, i) {

                          return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding:KString.padding,
                                        child: SvgPicture.asset(KAssets.area),
                                      ),
                                      CustomText(
                                        text: filterController.filterItemList[i],
                                        color: KColor.blackColor,
                                        fontFamily: KFonts.poppinsMedium,
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () => ref
                                        .read(filterControllerProvider)
                                        .selectCityFunction(
                                        filterController.filterItemList[i]),
                                    child: Padding(
                                      padding:KString.padding,
                                      child: Container(
                                        height: KString.size*Dimens.size3,
                                        width: KString.size*Dimens.size10,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(KString.size*Dimens.size2),
                                          color: filterController.selected.contains(
                                              filterController.filterItemList[i])
                                              ? KColor.darkRedColor
                                              : KColor.primaryColor,
                                        ),
                                        child: Center(
                                          child: CustomText(
                                            text: filterController.selected
                                                .contains(
                                                filterController.filterItemList[i])
                                                ? 'Remove'
                                                : 'Select',
                                            color: KColor.whiteColor,
                                            fontFamily: KFonts.poppinsMedium,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                          }),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
