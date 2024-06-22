import 'package:ecommerce_final_project/models/category_item.dart';
import 'package:ecommerce_final_project/controller/firebase_auth_services.dart'; // Import AuthController
import 'package:ecommerce_final_project/models/favorite.dart';
import 'package:ecommerce_final_project/models/shop.dart';
import 'package:ecommerce_final_project/models/transaction_services.dart';
import 'package:ecommerce_final_project/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart'; // Import GetX
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Inisialisasi AuthController menggunakan GetX
  Get.put(AuthController());

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Shop()),
        ChangeNotifierProxyProvider<Shop, CategoryItem>(
          create: (context) => CategoryItem(Provider.of<Shop>(context, listen: false).itemList),
          update: (context, shop, categoryItem) => CategoryItem(shop.itemList),
        ),
        ChangeNotifierProvider(create: (context) => Favorite()),
        ChangeNotifierProvider(create: (context) => TransactionServices()),
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
    return GetMaterialApp( // Ganti MaterialApp dengan GetMaterialApp
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: GoogleFonts.poppins().fontFamily),
      home: SplashScreen(),
    );
  }
}
