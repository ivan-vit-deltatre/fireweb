import 'package:fireweb/data/mock.dart';
import 'package:fireweb/models/video.dart';
import 'package:fireweb/service_locator.dart';
import 'package:fireweb/enums/view_state.dart';
import 'package:fireweb/services/video_service.dart';
import 'package:fireweb/viewmodels/base_model.dart';

class HomeViewModel extends BaseModel {
  final VideoService _videoService = locator<VideoService>();

  HomeViewModel();

  List<Video> _videos = [];
  List<Video> get videos => _videos;

  List<String> get tags => getSearchTags();

  // ignore: prefer_final_fields
  String _selectedTag = getSearchTags()[0];
  String get selectedTag => _selectedTag;

  void loadVideos() async {
    setState(ViewState.busy);
    _videos = await _videoService.getVideos(_selectedTag);
    notifyListeners();
    setState(ViewState.retrieved);
  }

  void selectTag(String tag) async {
    setState(ViewState.busy);
    _selectedTag = tag;
    _videos = await _videoService.getVideos(_selectedTag);
    notifyListeners();
    setState(ViewState.retrieved);
  }
}
