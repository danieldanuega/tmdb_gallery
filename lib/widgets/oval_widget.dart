import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OvalContainer extends StatelessWidget {
  final Function onPressed;
  final String text;

  OvalContainer({@required this.onPressed, this.text});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      color: Colors.cyan,
      splashColor: Colors.green,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: GoogleFonts.montserrat(
            fontSize: 39.0,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
