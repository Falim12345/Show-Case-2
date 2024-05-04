import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_showcase_2/presentation/widget/logon_bottom.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  late List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(4, (_) => TextEditingController());
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            top: 24,
            left: 24,
            right: 24,
            bottom: 8,
          ),
          child: Column(
            children: [
              const Text('OTP Verification',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 27),
              const Text('Enter Verification Code',
                  style: TextStyle(fontSize: 18)),
              const SizedBox(height: 27),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  4,
                  (index) => _buildCodeField(index, Colors.white),
                ),
              ),
              const SizedBox(height: 27),
              const Text(
                'Didn\'t receive code?',
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: AuthButton(
                      labelText: 'Verify',
                      onPressed: () {},
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCodeField(int index, Color color) {
    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: _controllers[index],
        keyboardType: TextInputType.number,
        maxLength: 1,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        decoration: const InputDecoration(
          counterText: '',
          border: InputBorder.none,
        ),
        onChanged: (String value) {
          if (value.isNotEmpty) {
            if (index < 3) {
              FocusScope.of(context).nextFocus();
            } else {
              // If last field, submit verification or do whatever you need
              // For demonstration purposes, I'm just printing the code
              String code =
                  _controllers.map((controller) => controller.text).join();
              print('Verification code is: $code');
            }
          }
        },
      ),
    );
  }
}
