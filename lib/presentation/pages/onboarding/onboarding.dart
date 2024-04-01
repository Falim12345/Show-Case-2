import 'package:flutter/material.dart';
import 'package:flutter_showcase_2/presentation/router/router.dart';
import 'package:flutter_showcase_2/presentation/router/routs.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/app_colors.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  void initState() {
    super.initState();
  }

  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 6,
                      child: Image.asset(
                        'lib/assets/onbording1.png',
                        fit: BoxFit.cover,
                      )),
                  const Expanded(
                    flex: 4,
                    child: Padding(
                        padding: EdgeInsets.only(
                          top: 24,
                          left: 24,
                          right: 24,
                          bottom: 8,
                        ),
                        child: SizedBox(
                          width: 428,
                          height: 212,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text('data',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w700,
                                        height: 0.06,
                                        letterSpacing: 0.12,
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              SizedBox(
                                width: 318,
                                child: Row(
                                  children: [
                                    Text(
                                      'dsadsasafsafasffsadfsafa',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: AppColors.bodyTextColor,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                          height: 0.09,
                                          letterSpacing: 0.12),
                                      softWrap: true,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 6,
                      child: Image.asset(
                        'lib/assets/onbording2.png',
                        fit: BoxFit.cover,
                      )),
                  const Expanded(
                    flex: 4,
                    child: Padding(
                        padding: EdgeInsets.only(
                          top: 24,
                          left: 24,
                          right: 24,
                          bottom: 8,
                        ),
                        child: SizedBox(
                          width: 428,
                          height: 212,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text('data',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w700,
                                        height: 0.06,
                                        letterSpacing: 0.12,
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              SizedBox(
                                width: 318,
                                child: Row(
                                  children: [
                                    Text(
                                      'dsadsasafsafasffsadfsafa',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: AppColors.bodyTextColor,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                          height: 0.09,
                                          letterSpacing: 0.12),
                                      softWrap: true,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 6,
                      child: Image.asset(
                        'lib/assets/onbording3.png',
                        fit: BoxFit.cover,
                      )),
                  const Expanded(
                    flex: 4,
                    child: Padding(
                        padding: EdgeInsets.only(
                          top: 24,
                          left: 24,
                          right: 24,
                          bottom: 8,
                        ),
                        child: SizedBox(
                          width: 428,
                          height: 212,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text('data',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w700,
                                        height: 0.06,
                                        letterSpacing: 0.12,
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              SizedBox(
                                width: 318,
                                child: Row(
                                  children: [
                                    Text(
                                      'hgjhg',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: AppColors.bodyTextColor,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                          height: 0.09,
                                          letterSpacing: 0.12),
                                      softWrap: true,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            ],
          ),
          floatingActionButton: SafeArea(
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Padding(
                padding: EdgeInsets.only(
                    right: _currentPageIndex == 2 ? 120.0 : 160.0, left: 14),
                child: SmoothPageIndicator(
                  controller: _pageController, // PageController
                  count: 3,

                  effect: const WormEffect(
                      dotColor: AppColors.inActiveDotColor,
                      activeDotColor: AppColors.primaryColor),
                  // your preferred effect
                  onDotClicked: (index) {},
                ),
              ),
              SizedBox(
                child: TextButton(
                  onPressed: () {
                    _scrollToPreviousPage();
                  },
                  child: const Text(
                    'Back',
                    style: TextStyle(color: AppColors.buttomTextColor),
                  ),
                ),
              ),
              // const SizedBox(width: 6),
              SizedBox(
                width: _currentPageIndex == 2
                    ? 120.0
                    : 80.0, // Установите разные значения ширины кнопки

                child: FloatingActionButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  backgroundColor: AppColors.primaryColor,
                  focusColor: AppColors.primaryColor,
                  onPressed: () {
                    _scrollToNextPage();
                  },
                  child: Text(
                    _currentPageIndex == 2 ? 'Get Started' : 'Next',
                    style: const TextStyle(color: AppColors.buttomTextColor),
                  ),
                ),
              ),
            ]),
          )),
    );
  }

  void _scrollToNextPage() {
    if (_currentPageIndex < 2) {
      setState(() {
        _currentPageIndex++;
      });
    } else {
      router.go(AppRouts.signup);
    }
    _pageController.animateToPage(
      _currentPageIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToPreviousPage() {
    setState(() {
      if (_currentPageIndex > 0) {
        _currentPageIndex--;
      } else {
        // Scrolls to the previous page in the page controller. If already on the first page, does nothing.
        return;
      }
      _pageController.animateToPage(
        _currentPageIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }
}
