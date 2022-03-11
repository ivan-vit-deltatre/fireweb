import 'package:fireweb/widgets/shared/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenRowHeading extends StatelessWidget {
  const HomeScreenRowHeading({
    Key? key,
    required this.screenSize,
    required this.title,
  }) : super(key: key);

  final String title;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: screenSize.height * 0.06,
        left: screenSize.width / 15,
        right: screenSize.width / 15,
      ),
      child: Text(
        title,
        style: GoogleFonts.ubuntu(
          fontSize: ResponsiveWidget.isSmallScreen(context) ? 20 : 26,
          color: Colors.blueGrey.shade900,
          fontWeight: FontWeight.bold
        )
      )
    );
  }
}