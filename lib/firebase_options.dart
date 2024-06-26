// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDW4YQfqMkKXbmJTq1pezr5EZe8y3kob0I',
    appId: '1:871964228720:web:07a8aa2581a06e8280c8b5',
    messagingSenderId: '871964228720',
    projectId: 'melody-72ad2',
    authDomain: 'melody-72ad2.firebaseapp.com',
    storageBucket: 'melody-72ad2.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCxLsG_Et0Zqrij9viO-xQzfYRiYGjuFBc',
    appId: '1:871964228720:android:bc621c6bbaf6cae580c8b5',
    messagingSenderId: '871964228720',
    projectId: 'melody-72ad2',
    storageBucket: 'melody-72ad2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCgmlVB7XlD5sPkUJzNTbpyhNsYE6RgfgY',
    appId: '1:871964228720:ios:372d6f095049f54280c8b5',
    messagingSenderId: '871964228720',
    projectId: 'melody-72ad2',
    storageBucket: 'melody-72ad2.appspot.com',
    iosClientId: '871964228720-cf91qe6td9nh3763p1ro06gv70ou2eaq.apps.googleusercontent.com',
    iosBundleId: 'com.example.melodyProjectMexique',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCgmlVB7XlD5sPkUJzNTbpyhNsYE6RgfgY',
    appId: '1:871964228720:ios:372d6f095049f54280c8b5',
    messagingSenderId: '871964228720',
    projectId: 'melody-72ad2',
    storageBucket: 'melody-72ad2.appspot.com',
    iosClientId: '871964228720-cf91qe6td9nh3763p1ro06gv70ou2eaq.apps.googleusercontent.com',
    iosBundleId: 'com.example.melodyProjectMexique',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDW4YQfqMkKXbmJTq1pezr5EZe8y3kob0I',
    appId: '1:871964228720:web:2bd4610124b03fc980c8b5',
    messagingSenderId: '871964228720',
    projectId: 'melody-72ad2',
    authDomain: 'melody-72ad2.firebaseapp.com',
    storageBucket: 'melody-72ad2.appspot.com',
  );

}