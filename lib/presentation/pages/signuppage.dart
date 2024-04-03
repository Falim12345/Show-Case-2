import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_showcase_2/core/app_colors.dart';
import 'package:flutter_showcase_2/presentation/widget/input_text_field.dart';
import 'package:flutter_showcase_2/presentation/widget/logon_bottom.dart';
import 'package:flutter_showcase_2/presentation/widget/password_input_text.dart';

class SingupPage extends StatefulWidget {
  const SingupPage({super.key});

  @override
  State<SingupPage> createState() => _SingupPageState();
}

class _SingupPageState extends State<SingupPage> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 24, bottom: 8, left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hello!',
                style: TextStyle(
                  color: Color(0xFF1877F2),
                  fontSize: 62,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.12,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Signup to get Started',
                style: TextStyle(
                  color: Color(0xFFB0B3B8),
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  height: 1,
                  letterSpacing: 0.12,
                ),
              ),
              const SizedBox(height: 35),
              const InputTextField(labelText: 'Username'),
              const SizedBox(height: 31),
              const PassswordInputTextField(labelText: 'Password'),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    value: _isChecked,
                    checkColor: AppColors.lightThemePrimaryColor,
                    activeColor: AppColors.primaryColor,
                    onChanged: (newValue) {
                      setState(() {
                        _isChecked = newValue!;
                      });
                    },
                  ),
                  const Text('Remember me'),
                  const SizedBox(width: 70),
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      'Forgot the password ?',
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const AuthButton(labelText: 'Signup'),
              const SizedBox(height: 6),
              const Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, // выравнивание текста по центру горизонтально
                crossAxisAlignment: CrossAxisAlignment
                    .center, // выравнивание текста по центру вертикально
                children: [Text('or continue with')],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        onPressed: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.facebook),
                            Text('Facebook'),
                          ],
                        )),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        onPressed: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.gavel),
                            Text('Google'),
                          ],
                        )),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text('Already have an account ?'),
                const SizedBox(width: 3),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    'login',
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
