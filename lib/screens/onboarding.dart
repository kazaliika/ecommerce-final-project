import 'package:ecommerce_final_project/utils/colors.dart';
import 'package:flutter/material.dart';

List onBoardingData = [
  {
    "image": "assets/images/on1.png",
    "title": "Beragam Koleksi Produk\nTerbaru",
    "deskripsi":
        "Lorem Ipsum is simply dummy text\nof the printing and typesetting\nindustry. Lorem",
  },
  {
    "image": "assets/images/on2.png",
    "title": "Koleksi Warna dan\nUkuran yang Lengkap",
    "deskripsi":
        "Lorem Ipsum is simply dummy text\nof the printing and typesetting\nindustry. Lorem",
  },
  {
    "image": "assets/images/on3.png",
    "title": "Temukan Pakaian yang\nPaling Cocok Untuk\nAnda",
    "deskripsi":
        "Lorem Ipsum is simply dummy text\nof the printing and typesetting\nindustry. Lorem",
  },
];

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();
  int halamanSekarang = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                controller: pageController,
                onPageChanged: (v) {
                  print(v.toString());
                  halamanSekarang = v;
                  setState(() {});
                },
                itemCount: onBoardingData.length,
                itemBuilder: (_, i) {
                  return Column(
                    children: [
                      Image.asset(onBoardingData[i]['image']),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: Text(
                                onBoardingData[i]['title'],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Text(
                                onBoardingData[i]['deskripsi'],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14, color: fontGrayColor),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                }),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Wrap(
                  spacing: 6,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: blueColor,
                          borderRadius: BorderRadius.circular(1000)),
                      height: 8,
                      width: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: GrayColor,
                          borderRadius: BorderRadius.circular(1000)),
                      height: 8,
                      width: 8,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: GrayColor,
                          borderRadius: BorderRadius.circular(1000)),
                      height: 8,
                      width: 8,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: GestureDetector(
                  onTap: () {
                    print("daftar akun");
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 13.5),
                    decoration: BoxDecoration(
                        color: blueColor,
                        borderRadius: BorderRadius.circular(30)),
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
        ],
      ),
    );
  }
}
