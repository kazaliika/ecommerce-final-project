import 'package:ecommerce_final_project/screens/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => const OnboardingScreen(),
      ));
    });
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Transparent status bar
      statusBarIconBrightness: Brightness.light, // Dark status bar icons
      systemNavigationBarColor: Colors.white, // White navigation bar
      systemNavigationBarIconBrightness:
          Brightness.light, // Dark navigation bar icons
    ));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.lightBlueAccent],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.shopify,
              size: 60,
              color: Colors.white,
            ),
            SizedBox(height: 1),
            Text(
              'Kutuku',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 50,
              ),
            ),
            SizedBox(height: 1),
            Text(
              'Belanja apapun bisa dari rumah',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            // Positioned(
            //   bottom: 100.0,
            //   left: 0,
            //   right: 0,
            //   child: Text(
            //     'Version 0.01',
            //     textAlign: TextAlign.center,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
