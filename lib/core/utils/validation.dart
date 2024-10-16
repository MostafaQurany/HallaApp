enum FieldType {
  email,
  name,
  password,
  text,
  phone,
  confPasword,
  category,
  none
}

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
      return "This field cannot be empty.";
    }
    return null;
  }

  static String? categoryValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter the category.";
    }
    return null;
  }

  static String? confirmPasswordValidate(
      String? value, String originalPassword) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value.trim() != originalPassword.trim()) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? phoneNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number';
    }
    if (value[0] == '+') {
      return 'Please enter a phone number start with 01';
    }
    if (value.length != 11) {
      return 'Please enter a valid phone number';
    }
    final phoneRegex = RegExp(r'^\+?[0-9]{10,15}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Enter a valid phone number';
    }
    return null;
  }
}
