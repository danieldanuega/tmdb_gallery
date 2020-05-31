import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmdb_gallery/models/detailMovie.dart';

class DetailAtribute extends StatelessWidget {
  DetailAtribute({@required this.attr, @required this.value});

  final dynamic attr;
  final dynamic value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$attr: ", style: GoogleFonts.roboto(fontSize: 18.0)),
        Divider(),
        Flexible(
            child: Text("$value", style: GoogleFonts.roboto(fontSize: 20.0)))
      ],
    );
  }
}
