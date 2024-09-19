// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'
    show kIsWeb, defaultTargetPlatform, TargetPlatform;

Future<void> initializeFirebase() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: _getFirebaseOptions(),
  );
}

FirebaseOptions _getFirebaseOptions() {
  if (kIsWeb) {
    return FirebaseOptions(
      apiKey: 'AIzaSyCkyUPhiQn4lBow3_wGnA3wrL8oJ6WdKGY',
      appId: '1:837355697155:web:c9873ae006d8cf14b20a36',
      messagingSenderId: '837355697155',
      projectId: 'viv-assistente',
      authDomain: 'viv-assistente.firebaseapp.com',
      storageBucket: 'viv-assistente.appspot.com',
    );
  }
  switch (defaultTargetPlatform) {
    case TargetPlatform.android:
      return FirebaseOptions(
        apiKey: 'AIzaSyD-5ZVOBGe7PbtLuV_B1v8S9X146_kBCzw',
        appId: '1:837355697155:android:73dde98dd01bc0f6b20a36',
        messagingSenderId: '837355697155',
        projectId: 'viv-assistente',
        storageBucket: 'viv-assistente.appspot.com',
      );
    case TargetPlatform.iOS:
      return FirebaseOptions(
        apiKey: 'AIzaSyAEKnLjlGYDRbQuUfMT28l_gTLOf3RyG0c',
        appId: '1:837355697155:ios:7e1a8e7b01692571b20a36',
        messagingSenderId: '837355697155',
        projectId: 'viv-assistente',
        storageBucket: 'viv-assistente.appspot.com',
        iosBundleId: 'com.viv.aplicativo',
      );
    default:
      throw UnsupportedError(
        'FirebaseOptions are not supported for this platform.',
      );
  }
}
