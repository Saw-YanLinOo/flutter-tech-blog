// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDXcGpyHu9HUu4UPp7ZMZoMkKZf8hKxPus',
    appId: '1:990198373996:web:197e61315523ca09b30249',
    messagingSenderId: '990198373996',
    projectId: 'yanyan-tech-blog',
    authDomain: 'yanyan-tech-blog.firebaseapp.com',
    storageBucket: 'yanyan-tech-blog.appspot.com',
    measurementId: 'G-WCRGNLKLHY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB6dBLf25jh9X69onGL4AR_QPAw8A0V99M',
    appId: '1:990198373996:android:2fc838c9d0701566b30249',
    messagingSenderId: '990198373996',
    projectId: 'yanyan-tech-blog',
    storageBucket: 'yanyan-tech-blog.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCal4N_D9P2zKZFb0jldlTRPb2dudwYKy0',
    appId: '1:990198373996:ios:a2df0091ae582a89b30249',
    messagingSenderId: '990198373996',
    projectId: 'yanyan-tech-blog',
    storageBucket: 'yanyan-tech-blog.appspot.com',
    iosClientId: '990198373996-7rsiuuk6430tu40i3lmvh88rt7f82gj3.apps.googleusercontent.com',
    iosBundleId: 'com.yanyan.techblog',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCal4N_D9P2zKZFb0jldlTRPb2dudwYKy0',
    appId: '1:990198373996:ios:a2df0091ae582a89b30249',
    messagingSenderId: '990198373996',
    projectId: 'yanyan-tech-blog',
    storageBucket: 'yanyan-tech-blog.appspot.com',
    iosClientId: '990198373996-7rsiuuk6430tu40i3lmvh88rt7f82gj3.apps.googleusercontent.com',
    iosBundleId: 'com.yanyan.techblog',
  );
}
