// import 'package:job_xprss/method_extension.dart';

class Validator {
  String? nullFieldValidate(String value) =>
      value.trim().isEmpty ? 'This Field is required' : null;

  String? validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());

    if (value.isEmpty) {
      return 'Please enter the email';
    } else if (!regex.hasMatch(value))
      return 'Please enter the validate email';
    else
      return null;
  }

  String? validatePassword(String value) {
    final RegExp _passwordRegExp = RegExp(
      r'(?=.*?[0-9])(?=.*?[A-Za-z]).+',
    );
    if (value.isEmpty) {
      return "This Field is required";
    } else if (value.length < 8) {
      return 'Password Must Be Eight';
    } else if (!_passwordRegExp.hasMatch(value)) {
      return "Password is required";
    } else {
      return null;
    }
  }

  String? validateEmptyPassword(String value) {
    if (value.isEmpty) {
      return "Please Enter Password";
    } else {
      return null;
    }
  }

  String? validateConfirmPassword(String password, String confirmPassword) {
    if (password != confirmPassword) {
      return "Password Does Not Match";
    } else {
      return null;
    }
  }

  String? validatePhoneNumber(String value) {
//    Pattern pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
    String pattern = r'\+?(88)?0?1[3456789][0-9]{8}\b';
    RegExp regex = new RegExp(pattern);
    if (value.trim() == '') {
      return "Enter Valid Phone Number";
    } else if (value.trim().length > 11) {
      return "Enter Valid Phone Number";
    } else if (!regex.hasMatch(value.trim()))
      return "Enter Valid Phone Number";
    else
      return null;
  }

  String? validateNullablePhoneNumber(String value) {
    String pattern = r'\+?(88)?0?1[3456789][0-9]{8}\b';
    RegExp regex = new RegExp(pattern);
    if (value.trim() == '') {
      return null;
    } else if (value.trim().length > 11) {
      return "Enter Valid Phone Number";
    } else if (!regex.hasMatch(value.trim()))
      return "Enter Valid Phone Number";
    else
      return null;
  }

//   String validatePhoneNumberForVerification(String value) {
// //    Pattern pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
//     Pattern pattern = r'\+?(88)?0?1[3456789][0-9]{8}\b';
//     RegExp regex = new RegExp(pattern);
//     if (value.trim() == '') {
//       return StringResources.phoneVerificationEnterValidPhoneNumber;
//     } else if (value.trim().length > 11) {
//       return StringResources.phoneVerificationEnterValidPhoneNumber;
//     } else if (!regex.hasMatch(value.trim()))
//       return StringResources.phoneVerificationEnterValidPhoneNumber;
//     else
//       return null;
//   }

  // String verificationCodeValidator(String value) {
  //   Pattern pattern = r'^(\d{6})?$';
  //   RegExp regex = new RegExp(pattern);
  //   if (!regex.hasMatch(value.trim()))
  //     return StringResources.invalidCode;
  //   else
  //     return null;
  // }

  // String numberFieldValidateOptional(String value) {
  //   Pattern pattern = r'^[1-9]\d*(\.\d+)?$';
  //   RegExp regex = new RegExp(pattern);
  //   if (value.trim().isEmpty) {
  //     return null;
  //   }
  //
  //   if (!regex.hasMatch(value.trim()))
  //     return StringResources.pleaseEnterDecimalValue;
  //   else
  //     return null;
  // }

  String? nameValidator(String value) {
    String pattern = '/[a-zA-Z]/i';
    RegExp regExp = new RegExp(pattern);
    if (value.length > 0) {
      if (!regExp.hasMatch(value)) {
        return "Invalid Name";
      } else {
        return null;
      }
    } else {
      return "This Field Is Required";
    }
  }

  String? expertiseFieldValidate(String value) {
    double x;
    String pattern = r'^([0-9]{1,2})+(\.[0-9]{1,2})?$';
    RegExp regex = new RegExp(pattern);
    if (value.trim().isEmpty) {
      return "This Field Is Required";
    } else {
      if (!regex.hasMatch(value.trim())) {
        return "Two Decimal";
      } else {
        x = double.parse(value.trim());
        if (x >= 0 && x < 11) {
          return null;
        } else {
          return "Value Within Range";
        }
      }
    }
  }

  String? validateFirstLetterTitle(String value) {
    if (value.substring(0, 1).toUpperCase() != value.substring(0, 1)) {
      return "Please Check Your Input";
    } else
      return null;
  }

  String? validateNonMandatoryEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);

    if (value.trim().isEmpty) {
      return null;
    } else if (!regex.hasMatch(value.trim()))
      return "please Enter A Valid Email Text";
    else
      return null;
  }

  String? firstCharacterValidate(String value) {
    String pattern = r'^([A-Z])\w';
    RegExp regex = new RegExp(pattern);
    if (value.length > 0 && !regex.hasMatch(value))
      return "Please Check Your Input";
    else if (value.length == 0)
      return "This Field Is Required";
    else
      return null;
  }

  String? whiteSpace(String value) {
    if (value.trim() == '') {
      return null;
    }
  }

  String? decimalNumberFieldValidateOptional(String value) {
    String pattern = r'^[1-9]\d*(\.\d+)?$';
    RegExp regex = new RegExp(pattern);
    if (value.trim().isEmpty) {
      return null;
    }

    if (!regex.hasMatch(value.trim()))
      return "Please Enter Decimal Value";
    else
      return null;
  }

  String? integerNumberNullableValidator(String value) {
    String pattern = r'^[1-9][0-9]*$';
    RegExp regex = new RegExp(pattern);
    if (value.isEmpty) {
      return null;
    } else if (!regex.hasMatch(value.trim()))
      return "Please Enter Valid Number";
    else
      return null;
  }

  String? integerNumberValidator(String value) {
    String pattern = r'^[1-9][0-9]*$';
    RegExp regex = new RegExp(pattern);

    if (!regex.hasMatch(value.trim()))
      return "please Enter Valid Number";
    else
      return null;
  }

  String? moneyAmountNullableValidate(String value) {
    String pattern =
        r'^(?=.*?\d)^\$?(([1-9]\d{0,2}(,\d{3})*)|\d+)?(\.\d{1,2})?$';
    RegExp regex = RegExp(pattern);
    if (value.trim().isEmpty) {
      return null;
    }
    if (!regex.hasMatch(value.trim()))
      return "please Enter Valid Amount";
    else
      return null;
  }
}
