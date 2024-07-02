enum FieldType { email, name, password, text, none }

class MyValidation {
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your email";
    }
    final RegExp emailRegex = RegExp(r"^[^@]+@[^@]+\.[^@]+");
    if (!emailRegex.hasMatch(value)) {
      return "Please enter a valid email";
    }
    return null;
  }

  static String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your name";
    }
    final RegExp nameRegex = RegExp(r"^[a-zA-Z ]+$");
    if (!nameRegex.hasMatch(value)) {
      return "Please enter a valid name";
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your password";
    }
    if (value.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }

  static String? textValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "This field cannot be empty";
    }
    return null;
  }
}
