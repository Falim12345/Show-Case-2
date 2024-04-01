import 'package:flutter/material.dart';

class SingupPage extends StatefulWidget {
  const SingupPage({super.key});

  @override
  State<SingupPage> createState() => _SingupPageState();
}

class _SingupPageState extends State<SingupPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 24, bottom: 8, left: 24, right: 24),
          child: Column(
            children: [
              Align(
                child: Text(
                  'Hello!',
                  style: TextStyle(
                    color: Color(0xFF1877F2),
                    fontSize: 48,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    height: 0.03,
                    letterSpacing: 0.12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
