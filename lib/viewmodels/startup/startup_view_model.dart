import 'package:fireweb/enums/view_state.dart';
import 'package:fireweb/navigation/route.dart';
import 'package:fireweb/navigation/route_names.dart';
import 'package:fireweb/service_locator.dart';
import 'package:fireweb/services/video_service.dart';
import 'package:fireweb/viewmodels/base_model.dart';
import 'package:flutter/widgets.dart';

class StartUpViewModel extends BaseModel {
  final VideoService _videoService = locator<VideoService>();

  StartUpViewModel();

  Future handleStartUpLogic(BuildContext context) async {
    setState(ViewState.busy);
    await _videoService.initialise();

    setState(ViewState.retrieved);
    navigateTo(context, homeViewRoute);
  }
}
