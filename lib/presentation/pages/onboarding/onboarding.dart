import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
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
              Container(
                color: Colors.white,
                child: Column(
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Выравнивание по горизонтали (слева)
                            mainAxisAlignment: MainAxisAlignment
                                .start, // Выравнивание по вертикали (вверху)
                            children: [
                              Row(
                                children: [
                                  Text('data',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('dsadsasafsafasfsafa'),
                                ],
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              Container(color: Colors.green),
              Container(color: Colors.red),
            ],
          ),
          floatingActionButton: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                    onPressed: () {
                      _scrollToPreviousPage();
                    },
                    child: const Text('Back')),
                const SizedBox(width: 6),
                FloatingActionButton(
                  onPressed: () {
                    _scrollToNextPage();
                  },
                  child: Text(_currentPageIndex == 2 ? 'Get Started' : 'Next'),
                ),
              ])),
    );
  }

  void _scrollToNextPage() {
    if (_currentPageIndex < 2) {
      setState(() {
        _currentPageIndex++;
      });
    } else {}
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
        // Если на первом экране, ничего не делаем
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
