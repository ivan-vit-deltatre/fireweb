import 'dart:async';
import 'dart:developer';
import 'package:fireweb/data/mock.dart';
import 'package:fireweb/models/video.dart';
import 'package:youtube_api/youtube_api.dart';

class VideoService {
  static String key = "AIzaSyBupw0tf1KDol5THKvTaU9fmzr_bV88zQA";
  YoutubeAPI? youtube;

  Future initialise() async {
    youtube = YoutubeAPI(key);
  }

  Future<List<Video>> getVideos(String tag) async {
    List<Video> results = []; // getMockVideoData();
    if (youtube == null) {
      return results;
    }

    List<YouTubeVideo> youtubeData = [];
    youtubeData = (await getVideoResultsBySearchKey(tag))!;

    if (youtubeData.isNotEmpty) {
      for (var element in youtubeData) {
        log(element.url);
        results.add(Video(
            title: element.title,
            description: element.description!,
            imageUrl: element.thumbnail.medium.url!,
            videoUrl: element.url,
            videoId: element.id!));
      }
    }

    return results;
  }

  Future<List<YouTubeVideo>?> getVideoResultsBySearchKey(String query) async {
    var videoResult = await youtube?.search(
      query,
      order: 'relevance',
      videoDuration: 'any',
    );
    videoResult = await youtube?.nextPage();
    return videoResult;
  }

  Video getVideoById(String videoId) {
    return Video(
        title: "title",
        description: "description",
        imageUrl: "image url",
        videoUrl: "video url",
        videoId: "");
  }
}
