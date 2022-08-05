import 'package:claim_core/claim/models/model_get_claim.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ScreenCalendar extends StatefulWidget {
  final claim_list;

  ScreenCalendar({required this.claim_list});

  @override
  _ScreenCalendarState createState() => _ScreenCalendarState();
}

class _ScreenCalendarState extends State<ScreenCalendar> {
  Map<DateTime, List<String>>? _events;

  CalendarFormat format = CalendarFormat.month;

  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  String hrCounter = '00';
  String minCounter = '00';
  String temp = "";

  TextEditingController _eventController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

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
    const Color primaryColor = Colors.white;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back,
            color: Colors.black87,
          ),
        ),
        backgroundColor: primaryColor,
        title: Text(
          "Calendar ${widget.claim_list.length}",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              padding: EdgeInsets.only(right: 25),
              onPressed: () {},
              icon: Icon(
                Icons.playlist_add_outlined,
                color: Colors.black,
                size: 30,
              )),
        ],
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: selectedDay,
            firstDay: DateTime(1990),
            lastDay: DateTime(2050),
            calendarFormat: format,
            onFormatChanged: (CalendarFormat _format) {
              setState(() {
                format = _format;
              });
            },
            startingDayOfWeek: StartingDayOfWeek.sunday,
            daysOfWeekVisible: true,

            //Day Changed
            onDaySelected: (DateTime selectDay, DateTime focusDay) {
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
                color: Colors.grey[600],
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(25.0),
              ),
              selectedTextStyle: TextStyle(color: Colors.white),
              todayDecoration: BoxDecoration(
                color: Colors.blue[300],
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
              headerMargin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
              formatButtonVisible: true,
              titleCentered: true,
              formatButtonShowsNext: false,
              formatButtonDecoration: BoxDecoration(
                color: Colors.blue[300],
                borderRadius: BorderRadius.circular(5.0),
              ),
              formatButtonTextStyle: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Divider(
            color: Colors.black,
            thickness: 1,
          ),
          Container(
            margin: EdgeInsets.all(15.0),
            width: double.infinity,
            height: 15,
            child: Text('Event List'),
          ),
          Container(
            height: 320,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ..._getEventsfromDay(selectedDay).map((event) => ListTile(
                        leading: Icon(
                          Icons.arrow_forward,
                          size: 20,
                        ),
                        title: Text(
                          event.state.toString(),
                        ),
                        trailing: Icon(Icons.delete_outline),
                        // subtitle: Text(event.),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
