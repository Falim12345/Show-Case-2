import 'package:flutter/material.dart';

class SecondOnbording extends StatefulWidget {
  const SecondOnbording({super.key});

  @override
  State<SecondOnbording> createState() => _SecondOnbordingState();
}

class _SecondOnbordingState extends State<SecondOnbording> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(children: const [
        SizedBox(
          width: 428,
          height: 584,
          child: Image(
              image:
                  AssetImage('lib/assets/pexels-photomix-company-242492.png')),
        ),
        Text('data')
      ]),
    );
  }
}
