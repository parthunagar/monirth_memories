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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBD4wYG8WBixeBEAd8ZarJ7e-ytpaczm_U',
    appId: '1:973852490167:android:38a66d2b532f87f11c5032',
    messagingSenderId: '973852490167',
    projectId: 'monirth-memories',
    // storageBucket: 'gs://cardmaker-95ba3.appspot.com',
  );

  ///
  /// in progress
  ///
  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCOFuPFEHPR5qJJMEczQQQ_1aJA8pNgzAc',
    appId: '1:49849915195:ios:3c048dfddb7efd637b091e',
    messagingSenderId: '49849915195',
    projectId: 'cardmaker-mobile',
    storageBucket: 'cardmaker-mobile.appspot.com',
    iosClientId:
        '49849915195-rpi1vuk7to45upgpo7onlca6hlohpjaa.apps.googleusercontent.com',
    iosBundleId: 'com.affluence.cardmaker',
  );
}
