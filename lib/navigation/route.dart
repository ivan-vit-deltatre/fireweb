import 'package:fireweb/navigation/route_names.dart';
import 'package:fireweb/views/detail/detail_view.dart';
import 'package:fireweb/views/detail/detail_view_arguments.dart';
import 'package:fireweb/views/home/home_view.dart';
import 'package:fireweb/views/startup/startup_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  if (settings.name != null) {
    switch (settings.name) {
      case homeViewRoute:
        return _getPageRoute(
          routeName: settings.name,
          viewToShow: const HomeView(key: Key('homeKey')),
        );
      case detailViewRoute:
        return _getPageRoute(
          routeName: settings.name,
          viewToShow: DetailView(
              key: const Key('detailKey'),
              video: (settings.arguments as DetailViewArguments).video),
        );
      case startUpViewRoute:
        return _getPageRoute(
          routeName: settings.name,
          viewToShow: const StartUpView(key: Key('startupKey')),
        );

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  } else {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              body:
                  Center(child: Text('No route defined for ${settings.name}')),
            ));
  }
}

PageRoute _getPageRoute(
    {String? routeName, required Widget viewToShow, arguments}) {
  return MaterialPageRoute(
      settings: RouteSettings(name: routeName, arguments: arguments),
      builder: (_) => viewToShow);
}

void navigateTo(BuildContext context, String page, [dynamic pageArguments]) {
  Navigator.pushNamed(
    context,
    page,
    arguments: pageArguments,
  );
}

void navigateBack(BuildContext context) {
  Navigator.pop(context);
}
