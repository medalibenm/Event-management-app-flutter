import 'package:challenge2/classes/bootcamp.dart';
import 'package:challenge2/colors.dart';
import 'package:challenge2/classes/event.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pages/manage_events.dart';

class bootWidget extends StatelessWidget {
  final Boot ee;
  final add;
  final delete;
  final change;
  const bootWidget(
      {super.key,
      required this.ee,
      this.add,
      this.delete,
      this.change});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          IconButton(
            icon: !ee.isDone
                ? Icon(
                    Icons.check_box_outline_blank_rounded,
                    size: 45,
                    color: kPinky,
                  )
                : Icon(
                    Icons.check_box_rounded,
                    size: 45,
                    color: kPinky,
                  ),
            onPressed: () => change(ee),
          ),
          SizedBox(
            width: 12,
          ),
          Text(
            ee.text,
            style:
                GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 19),
          ),
        ],
      ),
    );
  }
}
