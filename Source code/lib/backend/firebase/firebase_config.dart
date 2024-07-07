import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBso8jbSXDlV5yz1Fc-NqaFnLGUSy2TE6k",
            authDomain: "road-guard-pj5j2x.firebaseapp.com",
            projectId: "road-guard-pj5j2x",
            storageBucket: "road-guard-pj5j2x.appspot.com",
            messagingSenderId: "567835267608",
            appId: "1:567835267608:web:9cfd67febc0f6b11ca696d"));
  } else {
    await Firebase.initializeApp();
  }
}
