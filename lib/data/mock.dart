import 'package:fireweb/models/video.dart';

List<Video> getMockVideoData() {
  List<Video> data = [];
  for (var i = 0; i < 10; i++) {
    data.add(Video(
        title: "Test text Test text Test text Test text Test text",
        description:
            "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aliquam ornare wisi eu metus. Etiam bibendum elit eget erat. Curabitur ligula sapien, pulvinar a vestibulum quis, facilisis vel sapien. Praesent dapibus. Aliquam erat volutpat. Curabitur sagittis hendrerit ante. Etiam dictum tincidunt diam. In sem justo, commodo ut, suscipit at, pharetra vitae, orci. Etiam commodo dui eget",
        imageUrl: "https://picsum.photos/300/200",
        videoUrl:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
        videoId: ""));
  }
  return data;
}

List<String> getSearchTags() {
  List<String> data = [];
  data.add('Juventus');
  data.add('Barcelona');
  data.add('Real Madrid');
  data.add('Slavia Prague');
  data.add('Sparta Prague');
  data.add('Inter Milano');
  data.add('PSG');
  data.add('Manchester United');
  return data;
}
