// import 'package:ecommerce_final_project/screens/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UjiCoba extends StatefulWidget {
  const UjiCoba({super.key});

  @override
  State<UjiCoba> createState() => _UjiCobaState();
}

class _UjiCobaState extends State<UjiCoba> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    // Future.delayed(const Duration(seconds: 2), () {
    //   Navigator.of(context).pushReplacement(MaterialPageRoute(
    //     builder: (_) => const OnboardingScreen(),
    //   ));
    // });
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
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 350.0),
              child: Icon(
                Icons.shopify,
                size: 60,
                color: Colors.white,
              ),
            ),
            Text(
              'Kutuku',
              // textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 50,
              ),
            ),
            Text(
              'Belanja apapun bisa dari rumah',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            Column(
              children: [
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(top: 300),
                    child: Text(
                      'Version 0.01',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
