import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCkyUPhiQn4lBow3_wGnA3wrL8oJ6WdKGY",
            authDomain: "viv-assistente.firebaseapp.com",
            projectId: "viv-assistente",
            storageBucket: "viv-assistente.appspot.com",
            messagingSenderId: "837355697155",
            appId: "1:837355697155:web:c9873ae006d8cf14b20a36",
            measurementId: "G-V8M7MG4FXP"));
  } else {
    await Firebase.initializeApp();
  }
}
