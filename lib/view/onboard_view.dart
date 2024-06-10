import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tokoto/util/ucolor.dart';

import 'bottom_nav.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({super.key});

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  int currentIndex = 0;
  List<Map<String, dynamic>> listData = [
    {
      "title": "TOKOTO",
      "content": "Selamat datang di Tokoto, let’s shop!",
      "asset": "assets/splash.png",
    },
    {
      "title": "TOKOTO",
      "content":
          "Mari berbelanja dan nikmati promo promo menarik di dalam nya berlanja",
      "asset": "assets/splash1.png",
    },
    {
      "title": "TOKOTO",
      "content":
          "promo menarik anda puas kami sangat senang dan bahagia karna kallian sudah belanja di toko kami",
      "asset": "assets/splash2.png",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "TOKOTO",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: UColor.primary,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      listData[currentIndex]["content"],
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  if (currentIndex < listData.length - 1) {
                    setState(() {
                      currentIndex++;
                    });
                  } else {
                    setState(() {
                      currentIndex = 0;
                    });
                  }
                },
                child: Image.asset(
                  listData[currentIndex]["asset"],
                  height: 240,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < listData.length; i++)
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      width: currentIndex == i ? 20 : 6,
                      height: 6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: currentIndex == i
                            ? UColor.primary
                            : UColor.primary.withOpacity(0.2),
                      ),
                    )
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  if (currentIndex < listData.length - 1) {
                    setState(() {
                      currentIndex++;
                    });
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const BottomNav();
                        },
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: UColor.primary,
                  shape: const StadiumBorder(),
                  minimumSize:
                      Size(MediaQuery.of(context).size.width - 100, 50),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
