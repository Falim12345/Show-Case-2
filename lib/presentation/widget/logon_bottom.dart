import 'package:flutter/material.dart';
import 'package:flutter_showcase_2/core/app_colors.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    required this.labelText,
    required this.onPressed,
    super.key,
  });

  final String labelText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FloatingActionButton(
            backgroundColor: AppColors.primaryColor,
            onPressed: onPressed,
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
