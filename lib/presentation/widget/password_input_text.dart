import 'package:flutter/material.dart';
import 'package:flutter_showcase_2/core/app_colors.dart';

class PassswordInputTextField extends StatefulWidget {
  const PassswordInputTextField({
    super.key,
    required this.labelText,
    required this.onChanged,
    required this.controller,
    this.errorText,
  });
  final String labelText;
  final ValueChanged<String>? onChanged;
  final TextEditingController controller;
  final String? errorText;

  @override
  State<PassswordInputTextField> createState() =>
      _PassswordInputTextFieldState();
}

class _PassswordInputTextFieldState extends State<PassswordInputTextField> {
  // Параметр для текста
  bool obscureText = true;
  bool incorrectPassword = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 379,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                widget.labelText,
                style: const TextStyle(
                    color: Color(0xFFB0B3B8), fontFamily: 'Poppins'),
              ),
              const Text('*', style: TextStyle(color: AppColors.errorColor)),
            ],
          ),
          const SizedBox(height: 4),
          TextField(
            controller: widget.controller,
            onChanged: widget.onChanged,
            obscureText: obscureText,
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
                errorText: widget.errorText,
                filled: true,
                fillColor: const Color(0xFF3A3B3C),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                )),
          ),
        ],
      ),
    );
  }
}
