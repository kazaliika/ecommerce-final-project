import 'package:ecommerce_final_project/screens/splash_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDCXY382IGcAS7eb7V2rtNDI33IdGHgmFM",
          authDomain: "ecommerce-final-project-2a42d.firebaseapp.com",
          projectId: "ecommerce-final-project-2a42d",
          storageBucket: "ecommerce-final-project-2a42d.appspot.com",
          messagingSenderId: "367418185512",
          appId: "1:367418185512:web:6cd38310b210fb828a621d"),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

// whenever your initialization is completed, remove the splash screen:

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: GoogleFonts.poppins().fontFamily),
      home: SplashScreen(),
    );
  }
}
