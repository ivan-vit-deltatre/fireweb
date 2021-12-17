import 'package:fireweb/models/video.dart';
import 'package:fireweb/service_locator.dart';
import 'package:fireweb/enums/view_state.dart';
import 'package:fireweb/services/video_service.dart';
import 'package:fireweb/viewmodels/base_model.dart';

class DetailViewModel extends BaseModel {
  final VideoService _videoService = locator<VideoService>();

  DetailViewModel();

  Video? _video;

  void getVideoDetail(String videoId) {
    setState(ViewState.busy);
    _video = _videoService.getVideoById(videoId);
    notifyListeners();
    setState(ViewState.retrieved);
  }
}
