class Validations {
  static String? phoneValidation(String? value) {
    if (value!.length != 10) {
      return "Please input a valid number";
    }
    return null;
  }

  static String? pinCodeValidation(String? value) {
    if (value!.length != 6) {
      return "Please input a valid pin";
    }
    return null;
  }

  static String? nameValidation(String? value) {
    if (value!.length < 2) {
      return "Please input a valid name";
    }
    return null;
  }

  static String? fieldValidation(String? value) {
    if (value!.isEmpty) {
      return "This field is required";
    } else if (value.length < 2) {
      return "Please input a valid value";
    }
    return null;
  }

  static String? passwordValidation(String? value) {
    if (value!.isEmpty) {
      return "This password field is required";
    } else if (value.length < 6) {
      return "Please input a valid password";
    }
    return null;
  }

  static String? emailValidation(String? value) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (value!.isEmpty) {
      return "Company mail is required";
    } else if (!emailRegex.hasMatch(value)) {
      return "Please input a valid email";
    }
    return null;
  }

  static String? validateEmailPhone(String? value) {
    bool isEmail = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value!);
    bool isPhone = RegExp(r'^\d{10}$').hasMatch(value);

    if (isEmail || isPhone) {
      return null;
    } else {
      return 'Please enter a valid email or phone number';
    }
  }

  static final RegExp _urlRegex = RegExp(
    r"^(http(s)?:\/\/)?[^\s\.]+\.[^\s]{2,}(\/\S*)?$",
    caseSensitive: false,
    multiLine: false,
  );

  static bool validateLink(String? link) {
    if (link!.isNotEmpty) {
      return _urlRegex.hasMatch(link);
    }
    return true;
  }

  static String? linkValidator(String? value) {
    if (!validateLink(value)) {
      return 'Please enter a valid link';
    }
    return null;
  }
}
