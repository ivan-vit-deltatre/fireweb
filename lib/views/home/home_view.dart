import 'package:fireweb/enums/view_state.dart';
import 'package:fireweb/viewmodels/home/home_view_model.dart';
import 'package:fireweb/views/base_view.dart';
import 'package:fireweb/widgets/home/home_screen_access_bar.dart';
import 'package:fireweb/widgets/home/home_screen_app_bar.dart';
import 'package:fireweb/widgets/home/home_screen_row_heading.dart';
import 'package:fireweb/widgets/home/home_screen_row_tiles.dart';
import 'package:fireweb/widgets/shared/busy_overlay.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {

  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

 @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return BaseView<HomeViewModel>(
        onModelReady: (model) => model.loadVideos(),
        builder: (context, child, model) => BusyOverlay(
            show: model.state == ViewState.busy,
            child: Scaffold(
                extendBodyBehindAppBar: true,
                appBar: HomeScreenAppBar(screenSize),
                body: SingleChildScrollView(
                  controller: _scrollController,
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: screenSize.height * 0.45,
                            width: screenSize.width,
                            child: Image.asset(
                              '../../../assets/images/cover.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Column(
                            children: [
                              HomeScreenAccessBar(
                                screenSize: screenSize,
                                tags: model.tags,
                                selectedTag: model.selectedTag,
                                onTap: (tag) => model.selectTag(tag)
                              ),
                              Column(
                                children: [
                                  HomeScreenRowHeading(screenSize: screenSize, title: model.selectedTag),
                                  HomeScreenRowTiles(screenSize: screenSize, videos: model.videos)
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ))));
  }
}
