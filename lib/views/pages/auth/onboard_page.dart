import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:outkast/core/routes/app_route.dart';
import 'package:outkast/core/theme/app_pallette.dart';
import 'package:outkast/core/theme/app_theme.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  int _currentIndex = 0;
  List<String> messages = [
    'Unleash your inner potential.\nTrain with purpose. Move with freedom.',
    'Discover your strength.\nTrain with intention. Live without limits.',
    'Become unstoppable.\nDiscipline your body. Empower your mind.',
    'Push your boundaries.\nMove with power. Perform with confidence.',
    'Elevate your journey.\nTrain smart. Live strong.',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Image.asset(
                  'assets/image1.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Positioned(
                  bottom: 140,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      'Outkast',
                      style: AppStyle.titleMainBold(30, AppPallette.gradient1),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 60,
                  left: 0,
                  right: 0,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 400.0,
                      viewportFraction: 1,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                    items: [1, 2, 3, 4, 5].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  textAlign: TextAlign.center,
                                  messages[i - 1],
                                  style: AppStyle.textMedium(),
                                ),
                                SizedBox(height: 28),
                              ],
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
                Positioned(
                  bottom: 60,
                  left: 0,
                  right: 0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [1, 2, 3, 4, 5].map((i) {
                      return Container(
                        width: 8.0,
                        margin: EdgeInsets.symmetric(horizontal: 4.0),
                        height: 8.0,
                        decoration: BoxDecoration(
                          color: _currentIndex == (i - 1)
                              ? AppPallette.gradient1
                              : AppPallette.greyColor,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              transform: Matrix4.translationValues(0.0, -30.0, 0.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppPallette.backgroundColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 24.0,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 37),
                    ElevatedButton(
                      style: AppStyle.elevatedButtonStyle(true),
                      onPressed: () {
                        Get.toNamed(AppRoute.signIn);
                      },
                      child: Text(
                        'Sign in',
                        style: TextStyle(color: AppPallette.whiteColor),
                      ),
                    ),
                    SizedBox(height: 8),
                    ElevatedButton(
                      style: AppStyle.elevatedButtonStyle(false),
                      onPressed: () {
                        Get.toNamed(AppRoute.createAccount);
                      },
                      child: Text(
                        'Create Account',
                        style: TextStyle(color: AppPallette.blackColor),
                      ),
                    ),
                    SizedBox(height: 48),
                    GestureDetector(
                      onTap: () {
                        Get.offNamed(AppRoute.main);
                      },
                      child: Text(
                        'Continue as a guest',
                        style: AppStyle.textMedium(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
