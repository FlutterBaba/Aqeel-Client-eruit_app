import 'package:flutter/material.dart';
import 'package:flutter_clean_calendar/flutter_clean_calendar.dart';
import 'package:flutter_svg/svg.dart';

import 'calendar_filter.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime? selectedDay;
  late List<CleanCalendarEvent> selectedEvent;
  final Map<DateTime, List<CleanCalendarEvent>> events = {
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day): [
      CleanCalendarEvent(
        'Event name xyz',
        startTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 10, 0),
        endTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day, 12, 0),
        description: 'Start from 2nd Sep 2022',
        color: Colors.blue,
      ),
    ],
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2):
        [
      CleanCalendarEvent(
        'Event B',
        startTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 2, 10, 0),
        endTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 2, 12, 0),
        color: Colors.orange,
      ),
      CleanCalendarEvent(
        'Event C',
        startTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 2, 14, 30),
        endTime: DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day + 2, 17, 0),
        color: Colors.pink,
      ),
    ],
  };

  void _handleData(date) {
    setState(() {
      selectedDay = date;
      selectedEvent = events[selectedDay] ?? [];
    });
    print(selectedDay);
  }

  @override
  void initState() {
    // TODO: implement initState
    selectedEvent = events[selectedDay] ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          "assets/logo.png",
          scale: 2,
        ),
        title: const Text(
          "Calendar",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CalendarFilter(),
              ));
            },
            icon: SvgPicture.asset("assets/icons/filter.svg"),
          )
        ],
      ),
      body: SafeArea(
        child: Calendar(
          // isExpandable: true,
          startOnMonday: true,
          selectedColor: Colors.blue,
          todayColor: Colors.red,
          eventColor: Colors.green,
          eventDoneColor: Colors.amber,
          bottomBarColor: Colors.deepOrange,
          onRangeSelected: (range) {
            print('selected Day ${range.from},${range.to}');
          },
          onDateSelected: (date) {
            return _handleData(date);
          },
          events: events,
          isExpanded: true,
          dayOfWeekStyle: const TextStyle(
            fontSize: 15,
            color: Colors.black12,
            fontWeight: FontWeight.w100,
          ),
          bottomBarTextStyle: const TextStyle(
            color: Colors.white,
          ),
          hideBottomBar: false,
          hideArrows: false,
          weekDays: const ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
        ),
      ),
    );
  }
}






// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
//     show CalendarCarousel;
// import 'package:flutter_calendar_carousel/classes/event.dart';
// import 'package:intl/intl.dart' show DateFormat;

// import 'calendar_filter.dart';

// class CalendarPage extends StatefulWidget {
//   const CalendarPage({
//     Key? key,
//   }) : super(key: key);

//   @override
//   _CalendarPageState createState() => _CalendarPageState();
// }

// class _CalendarPageState extends State<CalendarPage> {
//   final DateTime _currentDate = DateTime.now();
//   DateTime _currentDate2 = DateTime.now();
//   String _currentMonth = DateFormat.yMMM().format(DateTime.now());
//   DateTime _targetDateTime = DateTime.now();

//   @override
//   Widget build(BuildContext context) {
//     final calendarCarouselNoHeader = CalendarCarousel<Event>(
//       weekdayTextStyle: const TextStyle(color: Color(0xff7E8299)),
//       onDayPressed: (date, events) {
//         setState(() => _currentDate2 = date);
//         for (var event in events) {
//           print(event.title);
//         }
//       },
//       showOnlyCurrentMonthDate: false,
//       weekendTextStyle: const TextStyle(color: Colors.black),
//       weekFormat: false,
//       height: 420.0,
//       selectedDateTime: _currentDate2,
//       targetDateTime: _targetDateTime,
//       customGridViewPhysics: const NeverScrollableScrollPhysics(),
//       markedDateCustomShapeBorder: const CircleBorder(
//         side: BorderSide(color: Colors.yellow),
//       ),
//       showHeader: false,
//       todayTextStyle: const TextStyle(
//         color: Colors.blue,
//       ),
//       todayButtonColor: Colors.grey.withOpacity(0.2),
//       selectedDayTextStyle: const TextStyle(
//         color: Colors.white,
//       ),
//       minSelectedDate: _currentDate.subtract(
//         const Duration(days: 360),
//       ),
//       maxSelectedDate: _currentDate.add(
//         const Duration(days: 360),
//       ),
//       prevDaysTextStyle: const TextStyle(
//         fontSize: 16,
//         color: Color(0xff7E8299),
//       ),
//       inactiveDaysTextStyle: const TextStyle(
//         color: Colors.grey,
//         fontSize: 16,
//       ),
//       onCalendarChanged: (DateTime date) {
//         setState(() {
//           _targetDateTime = date;
//           _currentMonth = DateFormat.yMMM().format(_targetDateTime);
//         });
//       },
//     );

//     return Scaffold(
//       appBar: AppBar(
//         leading: Image.asset(
//           "assets/logo.png",
//           scale: 2,
//         ),
//         title: const Text(
//           "Calendar",
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.of(context).push(MaterialPageRoute(
//                 builder: (context) => const CalendarFilter(),
//               ));
//             },
//             icon: SvgPicture.asset("assets/icons/filter.svg"),
//           )
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             Container(
//               margin: const EdgeInsets.only(
//                 top: 30.0,
//                 bottom: 16.0,
//                 left: 16.0,
//                 right: 16.0,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   FloatingActionButton.small(
//                     heroTag: null,
//                     backgroundColor: Colors.white,
//                     onPressed: () {
//                       setState(() {
//                         _targetDateTime = DateTime(
//                             _targetDateTime.year, _targetDateTime.month - 1);
//                         _currentMonth =
//                             DateFormat.yMMM().format(_targetDateTime);
//                       });
//                     },
//                     elevation: 0,
//                     shape: const RoundedRectangleBorder(
//                       side: BorderSide(
//                         color: Color(0xffE4E6EF),
//                       ),
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(15.0),
//                       ),
//                     ),
//                     child: const Icon(
//                       Icons.arrow_back_ios_new,
//                       color: Colors.black,
//                     ),
//                   ),
//                   Text(
//                     _currentMonth,
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 24.0,
//                     ),
//                   ),
//                   FloatingActionButton.small(
//                     heroTag: null,
//                     backgroundColor: Colors.white,
//                     onPressed: () {
//                       setState(() {
//                         _targetDateTime = DateTime(
//                             _targetDateTime.year, _targetDateTime.month + 1);
//                         _currentMonth =
//                             DateFormat.yMMM().format(_targetDateTime);
//                       });
//                     },
//                     elevation: 0,
//                     shape: const RoundedRectangleBorder(
//                       side: BorderSide(
//                         color: Color(0xffE4E6EF),
//                       ),
//                       borderRadius: BorderRadius.all(
//                         Radius.circular(15.0),
//                       ),
//                     ),
//                     child: const Icon(
//                       Icons.arrow_forward_ios,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: calendarCarouselNoHeader,
//             ), //
//           ],
//         ),
//       ),
//     );
//   }
// }
