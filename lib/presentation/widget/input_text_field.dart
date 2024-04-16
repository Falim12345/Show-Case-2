import 'package:flutter/material.dart';
import 'package:flutter_showcase_2/core/app_colors.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({
    super.key,
    required this.labelText,
    required this.onChanged,
    required this.controller,
    this.errorText,
  });
  final String labelText;
  final ValueChanged<String>? onChanged;
  final TextEditingController controller; // Объявление контроллера
  final String? errorText; // Добавляем параметр для отображения текста ошибки

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 379,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                labelText,
                style: const TextStyle(
                    color: Color(0xFFB0B3B8), fontFamily: 'Poppins'),
              ),
              const Text('*', style: TextStyle(color: AppColors.errorColor)),
            ],
          ),
          const SizedBox(height: 4),
          TextField(
            textAlignVertical: TextAlignVertical.top,
            controller: controller,
            onChanged: onChanged,
            decoration: InputDecoration(
              errorText: errorText,
              filled: true,
              fillColor: const Color(0xFF3A3B3C),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none),
            ),
          ),
        ],
      ),
    );
  }
}
