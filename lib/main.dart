import 'package:challenge2/widgets/event_widget.dart';
import 'package:challenge2/pages/manage_events.dart';
import 'package:flutter/material.dart';
import 'colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'classes/event.dart';
import 'classes/bootcamp.dart';
import 'widgets/boot_widget.dart';
import 'pages/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final list = Event.events;
  final list2 = Boot.boots;
  bool vsbl = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 380,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 35),
                child: Container(
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Profile()));
                          },
                          child: Image.asset(
                            'assets/Group 5759.png',
                            width: 40.0,
                            fit: BoxFit.fitWidth,
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: titles(),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 30, 0, 30),
                padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: calendar(),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Events',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: kPrimary,
                            thickness: 2,
                            indent: 5,
                            endIndent: 80,
                          ),
                        )
                      ],
                    ),
                    Expanded(
                        child: Column(
                      children: [
                        for (Event e in list)
                          eventWidget(
                            e: e,
                            vsbl: vsbl,
                            delete: _delete,
                            add: _add,
                            change: _change,
                            edit: _edit,
                          ),
                      ],
                    )),
                    Row(
                      children: [
                        Text(
                          'Bootcamp',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: kPrimary,
                            thickness: 2,
                            indent: 5,
                            endIndent: 80,
                          ),
                        )
                      ],
                    ),
                    Expanded(
                        child: Column(
                      children: [
                        for (Boot ee in list2)
                          bootWidget(
                            ee: ee,
                            change: _change,
                          ),
                      ],
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          edit_delete();
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 100,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Page2(add: _add,)));
                    },
                    icon: Icon(Icons.add),
                    label: Text(
                      'Add',
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(158, 123, 245, 1),
                      iconColor: Colors.white,
                      maximumSize: Size(190.0, 61.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                );
              });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 36,
        ),
        backgroundColor: kPinky, // Customize the background color
      ),
    );
  }

  Stack titles() {
    return Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${DateFormat('MMMM').format(DateTime.now())} ${DateTime.now().year}',
                          style: GoogleFonts.poppins(
                            fontSize: 13,
                            color: kPinky,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '${DateTime.now().day} ${DateFormat('EEEE').format(DateTime.now()).substring(0, 3).toUpperCase()}',
                          style: GoogleFonts.poppins(
                            color: kPinky,
                            fontSize: 42,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset('assets/780e0e64d323aad2cdd5 2 (1).png'),
                        Divider(
                          color: kPinky,
                          height: 0,
                        ),
                      ],
                    ),
                  ),
                ],
              );
  }

  void edit_delete() {
    setState(() {
      vsbl = !vsbl;
    });
  }

  void _add(String inputtext) {
    setState(() {
      list.add(
          Event(id: DateTime.now().microsecondsSinceEpoch, text: inputtext));
    });
    // add a controller
  }

  void _delete(int id_delete) {
    setState(() {
      list.removeWhere((item) => item.id == id_delete);
    });
  }

  void _change(dynamic item) {
    setState(() {
      item.isDone = !item.isDone;
    });
  }

  void _edit(String tt, String newtext) {
    setState(() {
      tt = newtext;
    });
  }
}

class calendar extends StatefulWidget {
  const calendar({super.key});

  @override
  State<calendar> createState() => _calendarState();
}

class _calendarState extends State<calendar> {
  var _selectedDay = DateTime.now();
  late DateTime _focusedDay;
  DateTime now = DateTime.now();
  late DateTime firstDayy = DateTime(now.year, now.month, 1);
  late DateTime lastDayy = DateTime(now.year, now.month + 1, 0);

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: firstDayy,
      lastDay: lastDayy,
      focusedDay: DateTime.now(),
      headerVisible: false,
      calendarStyle: const CalendarStyle(
        weekendTextStyle: TextStyle(),
      ),
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay; // update `_focusedDay` here as well
        });
      },
      calendarBuilders: CalendarBuilders(
        dowBuilder: (context, day) {
          final text = DateFormat.E().format(day);

          return Center(
            child: Text(
              text.substring(0, 1),
              style: GoogleFonts.inter(
                  color: kPinky, fontSize: 15, fontWeight: FontWeight.w600),
            ),
          );
        },
      ),
    );
  }
}
