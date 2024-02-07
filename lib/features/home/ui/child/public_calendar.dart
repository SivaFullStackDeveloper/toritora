import 'package:intl/intl.dart';

import '../../../../exports.dart';

class PublicCalendar extends StatefulWidget {
  const PublicCalendar({Key? key}) : super(key: key);

  @override
  State<PublicCalendar> createState() => _PublicCalendarState();
}

class _PublicCalendarState extends State<PublicCalendar> {
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

  var currentTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: (context, i) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonWidgets()
                      .calendarBoxes(KString.available, KColor.greenColor),
                  CommonWidgets()
                      .calendarBoxes('current Date', KColor.buttonColor),
                  CommonWidgets()
                      .calendarBoxes('Selected Date', KColor.primaryColor),
                ],
              ),
              CommonWidgets().commonSizedBox(20.0),
              Column(
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

                          ///------- end of calendar----------------------
                        ],
                      )),
                ],
              ),
              CommonWidgets().commonSizedBox(20.0),
              DualTextBar3(
                text: 'Selected slot details',
                text2: '',
              ),
              CommonWidgets().commonSizedBox(20.0),
              Material(
                elevation: 6,
                borderRadius: BorderRadius.circular(6.0),
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: KColor.primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text:
                              '${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day}',
                          color: KColor.blackColor,
                          fontFamily: KFonts.poppinsBold,
                        ),
                        CommonWidgets().commonSizedBoxWidth(2.0),
                        Text(
                          DateFormat('EEEE').format(DateTime.now()),
                          style: TextStyle(
                            color: KColor.primaryColor,
                            fontFamily: KFonts.poppinsBold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              CommonWidgets().commonSizedBox(20.0),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0),
                        ), // BorderRa

                        color: KColor.greenColor,
                        gradient: LinearGradient(stops: const [
                          0.02,
                          0.02
                        ], colors: [
                          KColor.greenColor,
                          KColor.whiteColor
                        ]),
                      ),
                      child:  ListTile(
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('eventTitle'),
                        ),
                        subtitle: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.location_on_outlined,color: KColor.darkRedColor,),
                            Text('location/ Event name'),
                          ],
                        ),
                        trailing:CustomText(
                          text: '10:00 - 11:00',
                          color: KColor.buttonColor,
                          fontFamily: KFonts.poppinsMedium,
                        ),
                      ),
                    ),
                  ),
                );
              }),
              CommonWidgets().commonSizedBox(20.0),
            ],
          );
        },
      ),
    );
  }
}
