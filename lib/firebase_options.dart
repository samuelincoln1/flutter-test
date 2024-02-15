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
    apiKey: 'AIzaSyAy-sWNYpHsERGtf5RTBkbtUX5J0kBY6uY',
    appId: '1:647469064633:web:79258ce69396aaa2c9d668',
    messagingSenderId: '647469064633',
    projectId: 'auth-test-f87d7',
    authDomain: 'auth-test-f87d7.firebaseapp.com',
    storageBucket: 'auth-test-f87d7.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC_5m7Mefm84zLwZNZOvk_FdXjLosBrt2Q',
    appId: '1:647469064633:android:8b6c56401f5fabbbc9d668',
    messagingSenderId: '647469064633',
    projectId: 'auth-test-f87d7',
    storageBucket: 'auth-test-f87d7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCl67GhBRbxV2KoyoJAlJJvaAglg71IGcI',
    appId: '1:647469064633:ios:8979419e6fd8c464c9d668',
    messagingSenderId: '647469064633',
    projectId: 'auth-test-f87d7',
    storageBucket: 'auth-test-f87d7.appspot.com',
    iosBundleId: 'com.example.teste',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCl67GhBRbxV2KoyoJAlJJvaAglg71IGcI',
    appId: '1:647469064633:ios:5ed9da448458dd6ec9d668',
    messagingSenderId: '647469064633',
    projectId: 'auth-test-f87d7',
    storageBucket: 'auth-test-f87d7.appspot.com',
    iosBundleId: 'com.example.teste.RunnerTests',
  );
}