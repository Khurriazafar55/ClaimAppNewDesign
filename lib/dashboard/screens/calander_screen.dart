import 'package:claim_core/app_theme_work/theme_colors.dart';
import 'package:claim_core/app_theme_work/widgets_reusing.dart';
import 'package:claim_core/claim/models/model_get_claim.dart';
import 'package:claim_core/dashboard/screens/dashboard2.dart';
import 'package:claim_core/dashboard/screens/screen_dashboard.dart';
import 'package:claim_core/utilities/constant_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:table_calendar/table_calendar.dart';

class CalanderScreen extends StatefulWidget {
  // const CalanderScreen({Key? key}) : super(key: key);
  final claim_list;

  CalanderScreen({required this.claim_list});
  @override
  State<CalanderScreen> createState() => _CalanderScreenState();
}

class _CalanderScreenState extends State<CalanderScreen> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  Map<DateTime, List<String>>? _events;

  CalendarFormat format = CalendarFormat.month;

  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  String hrCounter = '00';
  String minCounter = '00';
  String temp = "";

  final TextEditingController _eventController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  List<DataSingleClaim> _getEventsfromDay(DateTime date) {
    // return _events![date] ?? [];
    List<DataSingleClaim> data = [];

    return data;
  }

  @override
  void dispose() {
    _eventController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      body: GetBody(),
    );
  }

  Widget GetBody() {
    return Stack(children: [
      BackGroundColor1(),
      Container(
          // color: ThemeColors.background_color,
          child: Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Column(children: [
                const SizedBox(
                  height: 40,
                ),
                CalanderBar(),
                Expanded(
                    child: SingleChildScrollView(
                        child: Column(children: [
                  Container(
                      height: MediaQuery.of(context).size.height / 2.1,
                      margin:
                          const EdgeInsets.only(left: 12, right: 12, bottom: 5),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(255, 246, 238, 1),
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, top: 0),
                          child: SingleChildScrollView(
                              child: Column(children: [
                            TableCalendar(
                              focusedDay: selectedDay,
                              firstDay: DateTime(1990),
                              lastDay: DateTime(2050),
                              calendarFormat: format,
                              onFormatChanged: (CalendarFormat format) {
                                setState(() {
                                  format = format;
                                });
                              },
                              startingDayOfWeek: StartingDayOfWeek.sunday,
                              daysOfWeekVisible: true,

                              //Day Changed
                              onDaySelected:
                                  (DateTime selectDay, DateTime focusDay) {
                                setState(() {
                                  selectedDay = selectDay;
                                  focusedDay = focusDay;
                                });
                                print(focusedDay);
                              },
                              selectedDayPredicate: (DateTime date) {
                                return isSameDay(selectedDay, date);
                              },

                              eventLoader: _getEventsfromDay,

                              //To style the Calendar
                              calendarStyle: CalendarStyle(
                                isTodayHighlighted: true,
                                selectedDecoration: BoxDecoration(
                                  color: ThemeColors.background_color,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                selectedTextStyle:
                                    const TextStyle(color: Colors.white),
                                todayDecoration: BoxDecoration(
                                  color: ThemeColors.background_color,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                defaultDecoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                weekendDecoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              headerStyle: HeaderStyle(
                                headerMargin: const EdgeInsets.only(
                                    left: 10, right: 10, bottom: 20),
                                formatButtonVisible: true,
                                titleCentered: true,
                                formatButtonShowsNext: false,
                                formatButtonDecoration: BoxDecoration(
                                  color: Colors.blue[300],
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                formatButtonTextStyle: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ])))),
                  _timeShowerCard('Anaya Husain', '8:15 AM'),
                  _timeShowerCard('Anaya Husain', '8:15 AM'),
                  _timeShowerCard('Anaya Husain', '8:15 AM'),
                  _timeShowerCard('Anaya Husain', '8:15 AM'),
                ]))),
                Container(
                  // color: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                  child: Container(
                    //  width: double.infinity,
                    // height: 120,

                    margin:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: WidgetsReusing.getListBoxDecoration(),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            _drawerKey.currentState!.openDrawer();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            // margin: const EdgeInsets.only(left: 15),
                            child: const Icon(
                              Icons.menu,
                              size: 30,
                              color: Color.fromRGBO(255, 102, 0, 1),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                ConstantFunctions.OpenNewActivity(
                                    DashBoardScreen()),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(255, 102, 0, 1),
                                        spreadRadius: 2),
                                    BoxShadow(
                                        color: Color.fromRGBO(255, 102, 0, 1),
                                        // color: Colors.black.withOpacity(.25),
                                        offset: Offset(1, 1),
                                        blurRadius: 5,
                                        spreadRadius: 1)
                                  ]),
                              child: const Icon(
                                Icons.home,
                                size: 30,
                                color: Color.fromRGBO(255, 102, 0, 1),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            // Navigator.push(
                            //   context,
                            //   ConstantFunctions.OpenNewActivity(
                            //       const ScreenMyClaims()),
                            // );
                          },
                          child: const Icon(
                            Icons.list_alt,
                            size: 30,
                            color: Color.fromRGBO(255, 102, 0, 1),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ])))
    ]);
  }

  Widget CalanderBar() {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            decoration: const BoxDecoration(
              color: ThemeColors.background_color,
            ),
            // color: Color.fromRGBO(255, 102, 0, 1),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(left: 15),
            // decoration: WidgetsReusing.getListBoxDecoration(),
            child: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
        const Expanded(
          child: Center(
            child: Text(
              'Calendar',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            decoration: const BoxDecoration(
              color: ThemeColors.background_color,
            ),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(right: 10),
            // decoration: WidgetsReusing.getListBoxDecoration(),
            child: const Icon(
              Icons.note_add_outlined,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  _timeShowerCard(name, time) {
    TextStyle style = TextStyle(color: Colors.black, fontSize: 12);
    return Card(
        elevation: 5,
        color: Colors.white,
        margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 4,
                child: Text(name),
              ),
              Expanded(
                flex: 2,
                child: Text(time),
              )
            ],
          ),
        ));
  }
}
