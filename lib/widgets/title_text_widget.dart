import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 30.0, top: 10.0),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 37.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
