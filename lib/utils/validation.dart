class CustomValidator {
//--------------------- Email Validator ---------------------

  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

//--------------------- Email Validator ---------------------

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }

    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address.';
    }

    return null;
  }

//--------------------- Password Validator ---------------------

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }

    // Check for minimum password length
    if (value.length < 6) {
      return 'Password must be at least 6 characters long.';
    }

    // Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter.';
    }

    // Check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number.';
    }

    // Check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character.';
    }

    return null;
  }

  static String? validateText(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Please enter $fieldName';
    }
    return null;
  }

  static String? validateNumber(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Please enter $fieldName';
    }
    if (int.tryParse(value) == null) {
      return 'Please enter a valid $fieldName';
    }
    return null;
  }

  static String? validateDouble(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Please enter $fieldName';
    }
    if (double.tryParse(value) == null) {
      return 'Please enter a valid $fieldName';
    }
    return null;
  }
}





//  String emailValidator(String value) {
//     if (value.isEmpty) {
//       return 'Please enter a valid email';
//     }

//     // String pattern = r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$';
//     // RegExp regExp = new RegExp(pattern);
//     //
//     // if (!regExp.hasMatch(value)) {
//     //   // print('here');
//     //   return 'Please enter a valid email';
//     // }

//     return null;
//   }

//   String passwordValidator(String value) {
//     if (value == null) {
//       return 'Please enter a valid password';
//     }

//     if (value.length < 8) {
//       print('pass');
//       return 'Please enter a password with more than 8 characters';
//     }

//     String pattern =
//         r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
//     RegExp regExp = new RegExp(pattern);

//     if (!regExp.hasMatch(value)) {
//       return 'Please enter a valid password';
//     }

//     password = value;
//     return null;
//   }

//   String rePasswordValidator(String rePassword) {
//     if (password.compareTo(rePassword) != 0) {
//       print('here');
//       return "Your password doesn't match";
//     }

//     return null;
//   }

//   String ageValidator(String value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter a valid age';
//     }

//     print('here');

//     int intValue = int.parse(value);

//     if (intValue < 18) {
//       return 'Please enter a valid age';
//     }

//     if (intValue > 100) {
//       return 'Please enter a valid age';
//     }

//     return null;
//   }

//   String bloodValidator(String value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter a valid blood group';
//     }

//     String pattern = r'^(A|B|AB|O)[+-]$';
//     RegExp regExp = new RegExp(pattern);

//     if (!regExp.hasMatch(value)) {
//       return 'Please enter a valid blood group';
//     }

//     return null;
//   }

//   String licenseValidator(String value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter a valid License Number';
//     }

//     String pattern =
//         r'^(([A-Z]{2}[0-9]{2})( )|([A-Z]{2}-[0-9]{2}))((19|20)[0-9][0-9])[0-9]{7}$';
//     RegExp regExp = new RegExp(pattern);

//     if (!regExp.hasMatch(value)) {
//       return 'Please enter a valid License Number';
//     }

//     return null;
//   }

//   String contactValidator(String value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter a valid phone number';
//     }

//     if (value.length != 10) {
//       return 'Please enter a valid phone number';
//     }

//     String pattern = r'^[0-9]*$';
//     RegExp regExp = new RegExp(pattern);

//     if (!regExp.hasMatch(value)) {
//       return 'Please enter a valid phone number';
//     }

//     return null;
//   }

//   String nameValidator(String value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter a valid name';
//     }

//     String pattern = r"^[A-Za-z\s]{1,}[\.]{0,1}[A-Za-z\s]{0,}$";
//     RegExp regExp = new RegExp(pattern);

//     if (!regExp.hasMatch(value)) {
//       return 'Please enter a valid name';
//     }

//     return null;
//   }

//   // Vehicle Details Registration

//   String modelNameValidator(String value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter a valid model name';
//     }

//     String pattern = r"^[A-Za-z\s]{1,}[\.]{0,1}[A-Za-z\s]{0,}$";
//     RegExp regExp = new RegExp(pattern);

//     if (!regExp.hasMatch(value)) {
//       return 'Please enter a valid model name';
//     }

//     return null;
//   }

//   String vehicleNumberValidator(String value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter a valid vehicle number';
//     }

//     if (value.length < 8) {
//       return 'Please enter a valid vehicle number';
//     }

//     String pattern = r"^[A-Za-z\s]{1,}[\.]{0,1}[A-Za-z\s]{0,}$";
//     RegExp regExp = new RegExp(pattern);

//     if (!regExp.hasMatch(value)) {
//       return 'Please enter a valid vehicle number';
//     }

//     return null;
//   }

//   String ownerNameValidator(String value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter a valid owner name';
//     }

//     String pattern = r"^[a-zA-Z]+$";
//     RegExp regExp = new RegExp(pattern);

//     if (!regExp.hasMatch(value)) {
//       return 'Please enter a valid owner name';
//     }

//     return null;
//   }

//   String colorValidator(String value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter a valid color';
//     }

//     String pattern = r"^[a-zA-Z]+$";
//     RegExp regExp = new RegExp(pattern);

//     if (!regExp.hasMatch(value)) {
//       return 'Please enter a valid color';
//     }

//     return null;
//   }

//   String aadharNumberValidator(String value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter a valid aadhar number';
//     }

//     if (value.length != 12) {
//       return 'Please enter a valid aadhar number';
//     }

//     String pattern = r'^[0-9]*$';
//     RegExp regExp = new RegExp(pattern);

//     if (!regExp.hasMatch(value)) {
//       return 'Please enter a valid aadhar number';
//     }

//     return null;
//   }