import 'package:ecommerce_final_project/utils/colors.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset('assets/images/on1.png'),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: const Text(
                    "Beragam Koleksi Produk\nTerbaru",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Lorem Ipsum is simply dummy text\nof the printing and typesetting\nindustry. Lorem",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: fontGrayColor),
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              print("daftar akun");
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 13.5),
                decoration: BoxDecoration(
                    color: blueColor, borderRadius: BorderRadius.circular(30)),
                child: Text(
                  'Daftar Akun',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: GestureDetector(
              onTap: () {
                print("sudah punya akun");
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 13.5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  'Sudah Memiliki Akun',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: blueColor),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
