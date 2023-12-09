import 'package:flutter/material.dart';

class OnboardingPageTwo extends StatefulWidget {
  const OnboardingPageTwo({super.key});

  @override
  State<OnboardingPageTwo> createState() => _OnboardingPageTwoState();
}

class _OnboardingPageTwoState extends State<OnboardingPageTwo> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
      children: [
        Image(
          image: AssetImage('lib/assets/pexels-photomix-company-242492.png'),
          width: 428,
          height: 584,
        ),
        Row(
          children: [
            SizedBox(
              width: 428,
              height: 212,
              child: Text('dfgdsgdsgsdgdsgsgdsg'),
            ),
          ],
        )
      ],
    ));
  }
}
