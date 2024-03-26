import 'package:challenge2/colors.dart';
import 'package:challenge2/classes/event.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pages/manage_events.dart';
import '../pages/edit.dart';

class eventWidget extends StatelessWidget {
  final Event e;
  final vsbl;
  final add;
  final delete;
  final change;
  final edit;
  const eventWidget({
    super.key,
    required this.e,
    this.vsbl,
    this.add,
    this.delete,
    this.change,
    this.edit,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          IconButton(
            icon: e.isDone
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
            onPressed: () => change(e),
          ),
          SizedBox(
            width: 12,
          ),
          Flexible(
            flex: vsbl ? 2 : 4,
            child: Text(
              e.text,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500, fontSize: 19),
            ),
          ),
          // edit and delete icons
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Visibility(
                  visible: vsbl,
                  child: Row(
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: kPinky,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Page3(
                                          tt: e.text,
                                          edit: edit,
                                        )));
                          }),
                      IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: kPinky,
                          ),
                          onPressed: () {
                            delete(e.id);
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
