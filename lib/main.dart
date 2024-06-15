import 'package:ecommerce_final_project/models/favorite.dart';
import 'package:ecommerce_final_project/models/shop.dart';
import 'package:ecommerce_final_project/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:provider/provider.dart';
import 'firebase_options.dart';


void main() {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Shop()),
        ChangeNotifierProvider(create: (context) => Favorite()),
      ],
      child: const MyApp(),
    ),
  );
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
