import 'package:fireweb/enums/view_state.dart';
import 'package:fireweb/models/video.dart';
import 'package:fireweb/navigation/route.dart';
import 'package:fireweb/navigation/route_names.dart';
import 'package:fireweb/viewmodels/home/home_view_model.dart';
import 'package:fireweb/views/base_view.dart';
import 'package:fireweb/views/detail/detail_view_arguments.dart';
import 'package:fireweb/views/home/grid_card.dart';
import 'package:fireweb/widgets/home/tags_row.dart';
import 'package:fireweb/widgets/shared/busy_overlay.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
        onModelReady: (model) => model.loadVideos(),
        builder: (context, child, model) => BusyOverlay(
            show: model.state == ViewState.busy,
            child: Scaffold(
              backgroundColor: Colors.black,
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: <Widget>[
                  Container(
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20.0),
                            child: Text(
                              "Search Tags",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.ubuntu(
                                  fontSize: 20,
                                  color: Colors.blueGrey.shade900,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          TagsRow(
                            tags: model.tags,
                            selectedTag: model.selectedTag,
                            onTap: (tag) => model.selectTag(tag),
                          )
                        ],
                      )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: (1 / 1),
                            crossAxisCount: 5,
                          ),
                          itemCount: model.videos.length,
                          itemBuilder: (BuildContext context, int index) {
                            Video video = model.videos[index];
                            return GestureDetector(
                              onTap: () => {
                                navigateTo(
                                    context,
                                    detailViewRoute,
                                    DetailViewArguments(
                                      video,
                                    ))
                              },
                              child: GridCard(
                                  title: video.title,
                                  description: video.description,
                                  imageUrl: video.imageUrl),
                            );
                          }),
                    ),
                  )
                ]),
              ),
            )));
  }
}
