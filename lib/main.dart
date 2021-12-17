import 'package:fireweb/navigation/route.dart';
import 'package:fireweb/service_locator.dart';
import 'package:fireweb/views/startup/startup_view.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StartUpView(),
      onGenerateRoute: generateRoute
    );
  }
}
