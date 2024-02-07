import 'package:intl/intl.dart';

import '../../../../exports.dart';

class CalendarScreen extends ConsumerStatefulWidget {
  static const String routeName = '/calendarScreen';
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends ConsumerState<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDate;

  Map<String, List> mySelectedEvents = {};

  final titleController = TextEditingController();
  final descpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedDate = _focusedDay;
    loadPreviousEvents();
  }

  loadPreviousEvents() {
    mySelectedEvents = {
      "2023-04-30": [
        {"eventDescp": "11", "eventTitle": "111"},
        {"eventDescp": "22", "eventTitle": "22"},
        {"eventDescp": "11", "eventTitle": "111"},
        {"eventDescp": "22", "eventTitle": "22"}
      ],
      "2023-05-1": [
        {"eventDescp": "22", "eventTitle": "22"}
      ],
      "2023-05-02": [
        {"eventTitle": "ss", "eventDescp": "ss"}
      ]
    };
  }

  List _listOfDayEvents(DateTime dateTime) {
    if (mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)] != null) {
      return mySelectedEvents[DateFormat('yyyy-MM-dd').format(dateTime)]!;
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
///---------------------------------------- APP BAR -----------------------------------------------------------
      appBar: CommonWidgets().commonAppBar(text:KString.calendar,ref: ref,actions:[]),


      body:
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(bottom: 6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      TableCalendar(
                        calendarStyle: CalendarStyle(
                          markerDecoration: BoxDecoration(
                            color: KColor.greenColor,
                            shape: BoxShape.circle,
                          ),
                          selectedDecoration: BoxDecoration(
                            color: KColor.primaryColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        firstDay: DateTime.now(),
                        lastDay: DateTime(2100),
                        focusedDay: _focusedDay,
                        calendarFormat: _calendarFormat,
                        onDaySelected: (selectedDay, focusedDay) {
                          if (!isSameDay(_selectedDate, selectedDay)) {
                            setState(() {
                              _selectedDate = selectedDay;
                              _focusedDay = focusedDay;
                            });
                          }
                        },
                        selectedDayPredicate: (day) {
                          return isSameDay(_selectedDate, day);
                        },
                        onFormatChanged: (format) {
                          if (_calendarFormat != format) {
                            setState(() {
                              _calendarFormat = format;
                            });
                          }
                        },
                        onPageChanged: (focusedDay) {
                          _focusedDay = focusedDay;
                        },
                        eventLoader: _listOfDayEvents,
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 6,
                            width: 40,
                            decoration: BoxDecoration(
                              color: KColor.greyColor.withOpacity(0.4),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),

                      ///------- end of calendar----------------------
                    ],
                  )),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _listOfDayEvents(_selectedDate!).length,
                    itemBuilder: (context, i) {
                      return Column(
                        children: [
                          /*   SizedBox(
                                        height: 40,
                                        child: Column(
                                          children: [
                                            SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: 6,
                                                  width: 40,
                                                  decoration: BoxDecoration(
                                                    color:
                                                    ConstantColor.greyColor.withOpacity(0.4),
                                                    borderRadius: const BorderRadius.all(
                                                        Radius.circular(10)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10),
                                          ],
                                        ),
                                      ),*/
                          SizedBox(height: 20),
                          ..._listOfDayEvents(_selectedDate!).map((myEvents) {
                            return Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomText(
                                    color: KColor.primaryColor,
                                    text: '11:00',
                                    fontFamily: KFonts.poppinsRegular,
                                  ),
                                ),
                                Column(
                                  children: <Widget>[
                                    Container(
                                      width: 2,
                                      height: 60,
                                      color: KColor.greyColor,
                                    ),
                                    Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                          color: KColor.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                    ),
                                    Container(
                                      width: 2,
                                      height: 60,
                                      color: KColor.greyColor,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Expanded(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Material(
                                    borderRadius: BorderRadius.circular(10),
                                    elevation: 10,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: const Radius.circular(10.0),
                                          topRight: const Radius.circular(10.0),
                                          bottomRight:
                                              const Radius.circular(10.0),
                                          bottomLeft: const Radius.circular(10.0),
                                        ), // BorderRa

                                        color: KColor.greenColor,
                                        gradient: new LinearGradient(stops: [
                                          0.02,
                                          0.02
                                        ], colors: [
                                          KColor.greenColor,
                                          KColor.greenColor
                                              .withOpacity(0.1)
                                        ]),
                                      ),
                                      child: ListTile(
                                        title: Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 8.0),
                                          child:
                                              Text('${myEvents['eventTitle']}'),
                                        ),
                                        subtitle:
                                            Text(' ${myEvents['eventDescp']}'),
                                      ),
                                    ),
                                  ),
                                ))
                              ],
                            );
                          }),
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
          elevation: 0,
          backgroundColor: KColor.whiteColor,
          foregroundColor: KColor.transparentColor,
          splashColor: KColor.transparentColor,
          focusElevation: 0,
          focusColor: KColor.transparentColor,
          highlightElevation: 0,
          onPressed: () {
            openSheet(context);
          },
          label: Container(
            decoration: BoxDecoration(
              color: KColor.primaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomText(
                  text: 'Add your available time for Riusatsu',
                  color: KColor.primaryColor,
                  fontFamily: KFonts.poppinsMedium,
                ),
              ),
            ),
          )),
    );
  }

  var currentTime = DateTime.now();

  add() {
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

  openSheet(context) {
    return showModalBottomSheet<void>(
      barrierColor: Colors.transparent,
      backgroundColor: KColor.blackColor.withOpacity(0.8),
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
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
                    height:  KString.size*Dimens.size30,
                    child: ListView.builder(
                        itemCount: 15,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: KString.padding,
                            child: InkWell(
                              onTap: (){
                                add();
                                Navigator.of(context).pop();
                              },
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
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                      CommonWidgets().navigate(context,AvailabilityAddingScreen.routeName);
                    },
                    child: Container(
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
                  ),
                ],
              ),
            ),
          );
      },
    );
  }
}
