import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant.dart';

class MovieTile extends StatelessWidget {
  const MovieTile({
    Key key,
    @required this.posterPath,
    @required this.title,
    @required this.onTap,
  }) : super(key: key);

  final String posterPath;
  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 8,
          child: GestureDetector(
            onTap: onTap,
            child: posterPath == null
                ? Image(image: AssetImage("assets/empty.png"))
                : Image.network(kImageEndpoint + posterPath),
          ),
        ),
        Divider(
          height: 20.0,
        ),
        Flexible(
          flex: 2,
          child: Container(
            width: 300.0,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.josefinSans(
                fontSize: 28.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        )
      ],
    );
  }
}
