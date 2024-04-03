import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_showcase_2/core/app_colors.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key, required this.labelText});

  final String labelText; // Параметр для текста

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FloatingActionButton(
            backgroundColor: AppColors.primaryColor,
            onPressed: () {},
            child: Text(
              labelText,
              style: const TextStyle(color: AppColors.lightThemePrimaryColor),
            ),
          ),
        ),
      ],
    );
  }
}
