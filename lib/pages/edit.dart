import 'dart:math';

import 'package:challenge2/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'profile.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import '../main.dart';
import '../classes/bootcamp.dart';
import '../classes/event.dart';

void main() {
  runApp(const PageThree());
}

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Page3(

      ),
    );
  }
}

class Page3 extends StatelessWidget {
  Page3({super.key, this.edit,this.tt});

  final edit;
  final tt;
  final myController = TextEditingController();
  final list = Event.events;
  final list2 = Boot.boots;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Container(
              width: 380,
              padding: EdgeInsets.only(right: 13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 35),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            'assets/Default.png',
                          ),
                          style: ElevatedButton.styleFrom(
                              maximumSize: Size(85, 50),
                              elevation: 0,
                              backgroundColor: Colors.transparent),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 35),
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
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 23, top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Event Name',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500, fontSize: 19),
                        ),
                        Container(
                          width: double.infinity,
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          margin: EdgeInsets.only(bottom: 40, top: 20),
                          decoration: BoxDecoration(
                            // boxShadow: const [
                            //   BoxShadow(
                            //     color: Color(0xFF9E7BF5),
                            //     offset: Offset(0, 0),
                            //     blurRadius: 1.0,
                            //     spreadRadius: -0.0,
                            //   ),
                            // ],
                            color: Color(0xFF9E7BF5).withOpacity(0.25),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            controller: myController,
                            decoration: InputDecoration(
                                hintText: tt,
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: Color(0xFF9E7BF5))),
                          ),
                        ),
                        Text(
                          'Description',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500, fontSize: 19),
                        ),
                        Container(
                          width: double.infinity,
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          margin: EdgeInsets.only(bottom: 60, top: 20),
                          decoration: BoxDecoration(
                            // boxShadow: const [
                            //   BoxShadow(
                            //     color: Color(0xFF9E7BF5),
                            //     offset: Offset(0, 0),
                            //     blurRadius: 1.0,
                            //     spreadRadius: -0.0,
                            //   ),
                            // ],
                            color: Color(0xFF9E7BF5).withOpacity(0.25),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: 'Input',
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: Color(0xFF9E7BF5))),
                          ),
                        ),
                        Text(
                          'Time Range',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500, fontSize: 19),
                        ),
                        timeRangeRow(),
                        Button(context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container Button(BuildContext context) {
    return Container(
                        height: 180,
                        child: Center(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.noHeader,
                                animType: AnimType.rightSlide,
                                btnOkOnPress: () {  
                                Navigator.pop(context);
                                edit(tt, myController.text);
                                },
                                btnOkColor: kPinky,
                                padding: EdgeInsets.all(20),
                                body: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(20),
                                      width: 200,
                                      height: 200,
                                      child: Image.asset(
                                        'assets/780e0e64d323aad2cdd5 2 (2).png',
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(20),
                                      child: Text(
                                        'You added it successfully ',
                                        style: GoogleFonts.poppins(
                                            fontSize: 19.5,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              )..show();
                            },
                            icon: Icon(Icons.add),
                            label: Text(
                              'Add',
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromRGBO(158, 123, 245, 1),
                              iconColor: Colors.white,
                              minimumSize: Size(190.0, 61.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                        ),
                      );
  }

  Row timeRangeRow() {
    return Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'From : ',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color: Color.fromRGBO(0, 0, 0, 0.7)),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    margin: EdgeInsets.only(
                                        bottom: 60, right: 25),
                                    decoration: BoxDecoration(
                                      // boxShadow: const [
                                      //   BoxShadow(
                                      //     color: Color(0xFF9E7BF5),
                                      //     offset: Offset(0, 0),
                                      //     blurRadius: 1.0,
                                      //     spreadRadius: -0.0,
                                      //   ),
                                      // ],
                                      color:
                                          Color(0xFF9E7BF5).withOpacity(0.25),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          suffixIcon: Icon(
                                            Icons.calendar_month,
                                            color: Color(0xFF9E7BF5),
                                          ),
                                          suffixIconConstraints:
                                              BoxConstraints(
                                            maxHeight: 25,
                                            minWidth: 40,
                                          ),
                                          hintText: 'Input',
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(
                                              color: Color(0xFF9E7BF5))),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'To : ',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color: Color.fromRGBO(0, 0, 0, 0.7)),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    margin: EdgeInsets.only(
                                        bottom: 60, right: 25),
                                    decoration: BoxDecoration(
                                      // boxShadow: const [
                                      //   BoxShadow(
                                      //     color: Color(0xFF9E7BF5),
                                      //     offset: Offset(0, 0),
                                      //     blurRadius: 1.0,
                                      //     spreadRadius: -0.0,
                                      //   ),
                                      // ],
                                      color:
                                          Color(0xFF9E7BF5).withOpacity(0.25),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                          suffixIcon: Icon(
                                            Icons.calendar_month,
                                            color: Color(0xFF9E7BF5),
                                          ),
                                          suffixIconConstraints:
                                              BoxConstraints(
                                            maxHeight: 25,
                                            minWidth: 40,
                                          ),
                                          hintText: 'Input',
                                          border: InputBorder.none,
                                          hintStyle: TextStyle(
                                              color: Color(0xFF9E7BF5))),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
  }
}
