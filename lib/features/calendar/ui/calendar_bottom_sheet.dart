import 'package:intl/intl.dart';

import '../../../../exports.dart';

class CalenderBottomShet extends ConsumerStatefulWidget {
  var mySelectedEvents;
  var selectedDate;

  CalenderBottomShet(
      {Key? key, required this.mySelectedEvents, required this.selectedDate})
      : super(key: key);

  @override
  ConsumerState<CalenderBottomShet> createState() => _FilterBottomSheeetState();
}

class _FilterBottomSheeetState extends ConsumerState<CalenderBottomShet> {
  var currentTime = DateTime.now();

  add(mySelectedEvents, _selectedDate) {
    setState(() {
      if (mySelectedEvents[DateFormat('yyyy-MM-dd').format(_selectedDate!)] !=
          null) {
        mySelectedEvents[DateFormat('yyyy-MM-dd').format(_selectedDate!)]?.add({
          "eventTitle": 'this is a descritpion',
          "eventDescp": '',
        });
      } else {
        mySelectedEvents[DateFormat('yyyy-MM-dd').format(_selectedDate!)] = [
          {
            "eventTitle": '',
            "eventDescp": '',
          }
        ];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      Padding(
      padding:  EdgeInsets.only(left: KString.size*Dimens.size1Point8, right:  KString.size*Dimens.size1Point8),
      child: SizedBox(
        height:  KString.size*Dimens.size50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height:  KString.size*Dimens.sizePoint8,
                  width:  KString.size*Dimens.size4,
                  decoration: BoxDecoration(
                    color: KColor.whiteColor.withOpacity(0.4),
                    borderRadius:  BorderRadius.all(Radius.circular( KString.size*Dimens.sizePoint8)),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {},
                    child: CustomText(
                      text:
                          'Add your time on ${'${currentTime.year}/${currentTime.month}/${currentTime.day}'}',
                      color: KColor.whiteColor,
                      fontFamily: KFonts.poppinsRegular,
                    )),
              ],
            ),
            Text(
              'Add from your History ',
              style: TextStyle(
                color: KColor.whiteColor,
                fontFamily: KFonts.poppinsRegular,
                fontSize:  KString.size*Dimens.size1Point8,
              ),
            ),
            SizedBox(
              height:  KString.size*Dimens.size50,
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: KString.padding,
                      child: InkWell(
                        onTap: (){},
                        child: Container(
                          height:  KString.size*Dimens.size4,
                          decoration: BoxDecoration(
                            color: KColor.whiteColor,
                            borderRadius: BorderRadius.circular(KString.size*Dimens.size1),
                          ),
                          child: Padding(
                            padding:KString.padding,
                            child: Row(
                              children: [
                                CustomText(
                                  text: '10:00',
                                  color: KColor.blackColor,
                                  fontFamily: KFonts.poppinsMedium,
                                ),
                                CustomText(
                                  text: ' - 11:30',
                                  color: KColor.greyColor,
                                  fontFamily: KFonts.poppinsMedium,
                                ),
                                CommonWidgets().commonSizedBox( KString.size*Dimens.size1),
                                CustomText(
                                  text: 'Available',
                                  color: KColor.blackColor,
                                  fontFamily: KFonts.poppinsMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            CommonWidgets().commonSizedBox( KString.size*Dimens.sizePoint5),
            Container(
              height: KString.size*Dimens.size5,
              decoration: BoxDecoration(
                color: KColor.primaryColor,
                borderRadius: BorderRadius.circular(KString.size*Dimens.size1),
              ),
              child: Center(
                child: CustomText(
                  text: 'Create a new slot manually',
                  color: KColor.whiteColor,
                  fontFamily: KFonts.poppinsBold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


