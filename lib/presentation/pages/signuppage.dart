import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_showcase_2/core/app_colors.dart';
import 'package:flutter_showcase_2/presentation/widget/input_text_field.dart';
import 'package:flutter_showcase_2/presentation/widget/logon_bottom.dart';
import 'package:flutter_showcase_2/presentation/widget/password_input_text.dart';

import '../../data/repositories_imp/fairbase_auth_rep_imp.dart';

enum AuthMode { signup, login }

class SingupPage extends StatefulWidget {
  const SingupPage({super.key});

  @override
  State<SingupPage> createState() => _SingupPageState();
}

class _SingupPageState extends State<SingupPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AuthMode authMode = AuthMode.signup;
  final AuthManager _authManager =
      AuthManager(firebaseAuth: FirebaseAuth.instance);
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 24, bottom: 8, left: 24, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: authMode == AuthMode.signup ? 'Hello!' : 'Hello',
                        style: const TextStyle(
                          color: Colors.white, // цвет для "Hello"
                          fontSize: 62,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.12,
                        ),
                      ),
                      TextSpan(
                        text: authMode == AuthMode.signup ? '' : '\nAgain!',
                        style: TextStyle(
                          color: authMode == AuthMode.signup
                              ? Colors.transparent
                              : const Color(0xFF1877F2),
                          fontSize: 62,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.12,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  authMode == AuthMode.signup
                      ? 'Signup to get Started'
                      : 'Welcome back you\'ve \nbeen missed!',
                  style: const TextStyle(
                    color: Color(0xFFB0B3B8),
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    height: 1.5,
                    letterSpacing: 0.12,
                  ),
                ),
                const SizedBox(height: 35),
                InputTextField(
                  labelText: 'Email',
                  onChanged: (String value) {},
                  controller: usernameController,
                ),
                const SizedBox(height: 31),
                PassswordInputTextField(
                  labelText: 'Password',
                  onChanged: (String value) {},
                  controller: passwordController,
                ),
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
                AuthButton(
                  labelText: 'Signup',
                  onPressed: () {
                    _authManager.onEmailAndPassword(
                      email: usernameController.text,
                      password: passwordController.text,
                    );
                  },
                ),
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton.icon(
                                icon: Image.network(
                                    'https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-32.png'),
                                label: const Text(
                                  'Google',
                                  style: TextStyle(color: Colors.black),
                                ),
                                onPressed: null,
                              )
                            ],
                          )),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(authMode == AuthMode.signup
                      ? 'Already have an account ?'
                      : 'don`t have an account ?'),
                  const SizedBox(width: 3),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      authMode == AuthMode.signup ? 'login' : 'Sign Up',
                      style: const TextStyle(color: AppColors.primaryColor),
                    ),
                  )
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
