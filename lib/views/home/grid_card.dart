import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const GridCard(
      {required this.title,
      required this.description,
      required this.imageUrl,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.blueGrey,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: Image.network(imageUrl, fit: BoxFit.contain)),
            Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: SizedBox(
                width: 250,
                child: Text(
                  title,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.ubuntu(
                      fontSize: 16,
                      color: Colors.blueGrey.shade900,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Text(
                  description,
                  overflow: TextOverflow.visible,
                  maxLines: 4,
                  style: GoogleFonts.ubuntu(
                      fontSize: 12,
                      color: Colors.blueGrey.shade800,
                      fontWeight: FontWeight.bold),
                ))
          ]),
        ));
  }
}
