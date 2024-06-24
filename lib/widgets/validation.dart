class Validator {
  static RegExp emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)$',
  );

  static String? validateEmails(String value) {
    if (value.isEmpty) {
      return "Please enter an email address";
    } else if (!emailRegExp.hasMatch(value)) {
      return "Please enter a valid email address";
    }
    return null;
  }

  static String? validateFirstName(String value) {
    if (value.isEmpty) {
      return "Please enter First Name";
    }
    return null;
  }

  static String? validateLastName(String value) {
    if (value.isEmpty) {
      return "Please enter Last Name";
    }
    return null;
  }

  static String? validateMobile(String value) {
    if (value.length != 10) {
      return 'Mobile Number must be of 10 digit';
    } else if (value.isEmpty) {
      return "Please enter Contact Number";
    }
    return null;
  }

  static String? validateMobileOtp(String value) {
    if (value.length != 6) {
      return 'OTP must be of 6 digit';
    } else if (value.isEmpty) {
      return "Please enter OTP";
    }
    return null;
  }
}
