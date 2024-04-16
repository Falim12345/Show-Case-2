class Validator {
  String? validateEmail(String value) {
    // Простейшая валидация email адреса
    if (value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

// Метод для валидации пароля
  String? validatePassword(String value) {
    // Простейшая валидация пароля
    if (value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }
}
