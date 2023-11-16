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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyClsTz_C_BxE4K3543SxZY1xmG4L-GRSQg',
    appId: '1:906612181124:web:409bca0c407d26b8a65ad1',
    messagingSenderId: '906612181124',
    projectId: 'tiktok-clone-43d4d',
    authDomain: 'tiktok-clone-43d4d.firebaseapp.com',
    storageBucket: 'tiktok-clone-43d4d.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCF_XcD61Q-kg5DbjVWqpnlaKPnhc2vfWM',
    appId: '1:906612181124:android:8c41093aad188992a65ad1',
    messagingSenderId: '906612181124',
    projectId: 'tiktok-clone-43d4d',
    storageBucket: 'tiktok-clone-43d4d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCuSqd1MYbV-u0EFWKk1a4sC-rcI17BZLA',
    appId: '1:906612181124:ios:c9b59c38a7e44050a65ad1',
    messagingSenderId: '906612181124',
    projectId: 'tiktok-clone-43d4d',
    storageBucket: 'tiktok-clone-43d4d.appspot.com',
    iosBundleId: 'com.example.tiktokClone',
  );
}
