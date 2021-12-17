# fireweb

A new Flutter project.

## Getting Started

This project is a Fire project for checking flutter application development/debugging/releasing for web.

## Major commands:

- `flutter run -d chrome` - launches the application using the [development compiler] in a Chrome browser.

> Hot reload is not supported in a web browser Currently, Flutter supports hot restart, but not hot reload in a web browser.

- `flutter build web` - generates release build

A release build uses [dart2js] (instead of the development compiler) to produce a single JavaScript file `main.dart.js`. You can create a release build using release mode (`flutter run --release`) or by using `flutter build web`. This populates a `build/web` directory with built files, including an assets directory, which need to be served together.

You can also include `--web-renderer html` or `--web-renderer canvaskit` to select between the HTML or CanvasKit renderers, respectively.

- `flutter build web --release` - build app in release mode, using the default (auto) option;
- `flutter build web --web-renderer canvaskit --release` - build app in release mode, using just the CanvasKit renderer;
- `flutter run -d chrome --web-renderer html --profile` - run app in profile mode using the HTML renderer;

## Dependencies:

### Created Firebase project

https://console.firebase.google.com/u/2/project/video--ui/overview

### Add SDKs for Firebase products

https://firebase.google.com/docs/web/setup#available-libraries

### Project google console

https://console.cloud.google.com/home/dashboard?project=video--ui&authuser=2&supportedpurview=project

### YouTube data api

https://developers.google.com/youtube/v3/getting-started

### YouTube player package

https://medium.flutterdevs.com/youtube-player-in-flutter-9a1493bcb9ec

### Deploy to hosting

`firebase deploy --only hosting:video-ui`, configuration in `firebase.json` file

https://video-ui.web.app/#/

<!-- Links: -->

[development compiler]: https://dart.dev/tools/dartdevc
[dart2js]: https://dart.dev/tools/dart2js
