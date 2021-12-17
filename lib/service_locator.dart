import 'package:fireweb/services/video_service.dart';
import 'package:fireweb/viewmodels/detail/detail_view_model.dart';
import 'package:fireweb/viewmodels/home/home_view_model.dart';
import 'package:fireweb/viewmodels/startup/startup_view_model.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // register services
  locator.registerLazySingleton<VideoService>(() => VideoService());

  // register models
  locator.registerFactory<StartUpViewModel>(() => StartUpViewModel());
  locator.registerFactory<HomeViewModel>(() => HomeViewModel());
  locator.registerFactory<DetailViewModel>(() => DetailViewModel());
}
