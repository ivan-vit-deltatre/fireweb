import 'package:fireweb/models/video.dart';
import 'package:fireweb/widgets/shared/custom_scroll_behaviour.dart';
import 'package:fireweb/widgets/shared/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenRowTiles extends StatelessWidget {
  HomeScreenRowTiles({
    Key? key,
    required this.screenSize,
    required this.videos,
  }) : super(key: key);

  final Size screenSize;
  List<Video> videos;

  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? Padding(
            padding: EdgeInsets.only(top: screenSize.height / 50),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: screenSize.width / 15),
                  ...Iterable<int>.generate(videos.length).map(
                    (int pageIndex) => Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: screenSize.width / 2.5,
                              width: screenSize.width / 1.5,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: Image.network(
                                      videos[pageIndex].imageUrl,
                                      fit: BoxFit.cover)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: screenSize.height / 70,
                              ),
                              child: Text(
                                videos[pageIndex].title.substring(0, 20),
                                style: GoogleFonts.ubuntu(
                                    fontSize: 16,
                                    color: Colors.blueGrey.shade900,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: screenSize.width / 15),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : Padding(
            padding: EdgeInsets.only(
              top: screenSize.height * 0.05,
              left: screenSize.width / 10,
              right: screenSize.width / 10,
            ),
            child: ScrollConfiguration(
              behavior: CustomScrollBehaviour(),
              child: SingleChildScrollView(
                controller: controller,
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...Iterable<int>.generate(videos.length).map(
                      (int pageIndex) => Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: screenSize.width / 6,
                            width: screenSize.width / 3.8,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Image.network(
                                      videos[pageIndex].imageUrl,
                                      fit: BoxFit.cover
                                    ),
                            )
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: screenSize.height / 70,
                            ),
                              child: SizedBox(
                                width: screenSize.width / 3.8,
                                child: Text(
                                videos[pageIndex].title,
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.ubuntu(
                                      fontSize: 16,
                                      color: Colors.blueGrey.shade900,
                                      fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      )
                    ),
                      ],
                  )))
        );
  }
}
