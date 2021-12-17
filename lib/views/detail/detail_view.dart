import 'package:fireweb/enums/view_state.dart';
import 'package:fireweb/models/video.dart';
import 'package:fireweb/viewmodels/detail/detail_view_model.dart';
import 'package:fireweb/views/base_view.dart';
import 'package:fireweb/widgets/shared/busy_overlay.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class DetailView extends StatefulWidget {
  final Video video;
  const DetailView({Key? key, required this.video}) : super(key: key);

  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    final args = widget.video;

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        _controller = YoutubePlayerController(
          initialVideoId: args.videoId,
          params: const YoutubePlayerParams(
            showFullscreenButton: true,
            autoPlay: false,
          ),
        );
      });
    });

    /*
    _controller = VideoPlayerController.network(args.videoUrl)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });

      */
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<DetailViewModel>(
        builder: (context, child, model) => BusyOverlay(
              show: model.state == ViewState.busy,
              child: Scaffold(
                backgroundColor: Colors.black,
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _controller != null
                          ? Center(
                              child: SizedBox(
                                width: 800.0,
                                child: AspectRatio(
                                  aspectRatio: 16 / 9,
                                  child: YoutubePlayerIFrame(
                                      controller: _controller),
                                ),
                              ),
                            )
                          : Container()
                    ],
                  ),
                ),
              ),
            ));
  }
}
