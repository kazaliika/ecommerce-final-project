import 'package:ecommerce_final_project/screens/login_screen.dart';
import 'package:ecommerce_final_project/screens/register_screen.dart';
import 'package:ecommerce_final_project/utils/colors.dart';
import 'package:flutter/material.dart';

List onBoardingData = [
  {
    "image": "assets/images/onb1.png",
    "title": "Selamat Datang di Kutubu",
    "deskripsi":
        "Temukan berbagai kebutuhan Anda dengan mudah dan cepat di Kutubu. Dari kebutuhan sehari-hari hingga barang impian, semua ada di sini. Nikmati pengalaman berbelanja yang aman, nyaman, dan menyenangkan!",
  },
  {
    "image": "assets/images/onb2.png",
    "title": "Simpan Produk Favorit Anda",
    "deskripsi":
        "Jangan khawatir kehilangan produk yang Anda sukai. Dengan fitur Favorite kami, Anda dapat menyimpan dan mengakses kembali produk favorit kapan saja. Temukan dan simpan barang impian Anda dengan satu sentuhan!",
  },
  {
    "image": "assets/images/on3.png",
    "title": "Lacak Riwayat Transaksi Anda",
    "deskripsi":
        "Pantau semua pembelian Anda dengan mudah. Fitur Riwayat Transaksi kami memungkinkan Anda melihat kembali semua transaksi sebelumnya untuk referensi dan bukti pembelian. Belanja aman, nyaman, dan terorganisir dengan Kutubu!",
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
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                controller: pageController,
                onPageChanged: (v) {
                  setState(() {
                    halamanSekarang = v;
                  });
                },
                itemCount: onBoardingData.length,
                itemBuilder: (_, i) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                    AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.bounceInOut,
                      decoration: BoxDecoration(
                          color: halamanSekarang == 0 ? blueColor : grayColor,
                          borderRadius: BorderRadius.circular(1000)),
                      height: 8,
                      width: halamanSekarang == 0 ? 20 : 8,
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.bounceInOut,
                      decoration: BoxDecoration(
                          color: halamanSekarang == 1 ? blueColor : grayColor,
                          borderRadius: BorderRadius.circular(1000)),
                      height: 8,
                      width: halamanSekarang == 1 ? 20 : 8,
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.bounceInOut,
                      decoration: BoxDecoration(
                          color: halamanSekarang == 2 ? blueColor : grayColor,
                          borderRadius: BorderRadius.circular(1000)),
                      height: 8,
                      width: halamanSekarang == 2 ? 20 : 8,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return RegisterScreen();
                        },
                      ),
                    );
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
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
