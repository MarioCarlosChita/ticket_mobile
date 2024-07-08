enum FormValidatorMode {
  /// It checks if is `null`, `empty` and if it's a valid `email address`.
  email,

  // it checks if empty
  nullOrEmpty,

  /// Should be used for creating a password.
  /// It checks if it's `null`, `empty` and `8 characters long`, with at least
  /// `1 lower and uppercase`, and `1 symbol`!.
  passwordRegister,

  // check it the input is a positive number
  positiveNumber;
}

class FormValidator {
  static String? validate({
    FormValidatorMode? type,
    String? text,
    String? inputEmptyText,
    String? inputInvalidText,
  }) {
    switch (type) {
      case FormValidatorMode.email:
        return _email(
          userInput: text,
          emptyEmail: inputEmptyText ?? '',
          invalidEmail: inputInvalidText ?? '',
        );
      case FormValidatorMode.nullOrEmpty:
        return _nullOrEmpty(
          text: text,
          emptyText: inputEmptyText ?? '',
        );
      case FormValidatorMode.passwordRegister:
        return _passwordRegister(
          userInput: text,
          emptyPassword: inputEmptyText ?? '',
          invalidPassword: inputInvalidText ?? '',
        );
      case FormValidatorMode.positiveNumber:
        return _positiveNumber(
          userInput: text,
          emptyText: inputEmptyText ?? '',
          invalidText: inputInvalidText ?? '',
        );
      case null:
        return null;
    }
  }

  static final RegExp positiveRegex = RegExp(r'^[1-9][0-9]*$');

  static final RegExp _passwordRegex = RegExp(
    r'^.{6,}$',
  );
  static final RegExp _emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  static String? _positiveNumber({
    String? userInput,
    required String emptyText,
    required String invalidText,
  }) {
    if (userInput == null || userInput.trim().isEmpty) {
      return '\u24d8 $emptyText';
    }
    if (!_passwordRegex.hasMatch(userInput)) {
      return '\u24d8 $invalidText';
    }

    return null;
  }

  static String? _nullOrEmpty({
    String? text,
    required String emptyText,
  }) {
    if (text == null || text.trim().isEmpty) {
      return '\u24d8 $emptyText';
    }
    return null;
  }

  static String? _email({
    String? userInput,
    required String emptyEmail,
    required String invalidEmail,
  }) {
    if (userInput == null || userInput.trim().isEmpty) {
      return '\u24d8 $emptyEmail';
    }
    if (!_emailRegex.hasMatch(userInput)) {
      return '\u24d8 $invalidEmail';
    }
    return null;
  }

  static String? _passwordRegister({
    String? userInput,
    required String emptyPassword,
    required String invalidPassword,
  }) {
    if (userInput == null || userInput.trim().isEmpty) {
      return '\u24d8 $emptyPassword';
    }
    if (!_passwordRegex.hasMatch(userInput)) {
      return '\u24d8 $invalidPassword';
    }
    return null;
  }
}
