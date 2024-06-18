import 'package:ecommerce_final_project/controller/firebase_auth_services.dart';
import 'package:ecommerce_final_project/screens/home/home_screen.dart';
import 'package:ecommerce_final_project/screens/home/layout_home.dart';
import 'package:ecommerce_final_project/screens/login_screen.dart';
import 'package:ecommerce_final_project/screens/onboarding.dart';
import 'package:ecommerce_final_project/screens/profile_screen.dart';
import 'package:ecommerce_final_project/screens/register_screen.dart';
import 'package:ecommerce_final_project/screens/splash_screen.dart';
import 'package:ecommerce_final_project/utils/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(const MyApp());
}

// whenever your initialization is completed, remove the splash screen:

class MyApp extends StatelessWidget {
  final authC = AuthController;
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: GoogleFonts.poppins().fontFamily),
      home: SplashScreen(),
    );
  }
  //   }
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     theme: ThemeData(fontFamily: GoogleFonts.poppins().fontFamily),
  //     home: SplashScreen(),
  // );
}
