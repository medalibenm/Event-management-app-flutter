import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../colors.dart';
import '../classes/event.dart';
import '../widgets/event_widget.dart';
import '../classes/bootcamp.dart';
import '../widgets/boot_widget.dart';

void main() {
  runApp(const ProfilePage());
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Profile(),
    );
  }
}

class Profile extends StatelessWidget {
  Profile({super.key});
  final list = Event.events;
  final list2 = Boot.boots;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        header(context),
        Expanded(
          child: ListView(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 12,
                    height: 50,
                  ),
                  Text(
                    'Events Complete',
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: kPinky,
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: Column(
                children: [
                  for (Event e in list)
                    if (e.isDone == false)
                      eventWidget(
                        e: e,
                        add: () {},
                        delete: () {},
                        change: () {},
                        vsbl: false,
                      ),
                  for (Boot ee in list2)
                    if (ee.isDone == true)
                      bootWidget(
                        ee: ee,
                        add: () {},
                        delete: () {},
                        change: () {},
                      ),
                ],
              )),
            ],
          ),
        ),
      ]),
    );
  }

  Container header(BuildContext context) {
    return Container(
        child: Stack(
          children: [
            Image.asset(
              'assets/Union.png',
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            Container(
              margin: EdgeInsets.only(top: 25),
              child: Align(
                alignment: Alignment.topLeft,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    'assets/Default2.png',
                  ),
                  style: ElevatedButton.styleFrom(
                      maximumSize: Size(85, 50),
                      elevation: 0,
                      backgroundColor: Colors.transparent),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 170),
              child: Align(
                child: Image.asset(
                  'assets/Group 5759.png',
                  width: 120,
                  fit: BoxFit.contain,
                ),
              ),
            )
          ],
        ),
      );
  }
}
