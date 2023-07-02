String? passwordValidator(String? value) {
  if (value == '' || value == null) {
    return 'Password must not be empty!';
  } else if (value.trim().length < 6) {
    return 'Password Must be minimum of 6 characters long!';
  }

  return null;
}

String? emailValidator(String? value) {
  if (value == '' || value == null) {
    return 'Email must not be empty!';
  } else if (value.trim().length <= 3) {
    return 'Email must be over 3 characters long!';
  } else if (!value.trim().contains('@')) {
    return 'Invalid Email Address';
  }

  return null;
}

String? nameValidator(String? value) {
  if (value == '' || value == null) {
    return 'Name must not be empty!';
  } else if (value.trim().length <= 2) {
    return 'Name must be min 3 characters long!';
  }
  return null;
}


String? mobileValidator(String? value) {
  if (value == '' || value == null) {
    return 'Mobile must not be empty!';
  } else if (value.trim().length <= 8) {
    return 'Mobile must be min 8 characters long!';
  }
  return null;
}
