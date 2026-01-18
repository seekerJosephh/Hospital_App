class FormUtil {
  // Function to validate First Name
  static String? validateFirstName(String? firstName) {
    if (firstName == null || firstName.isEmpty) {
      return "First Name cannot be empty!";
    } else if (firstName.length < 2) {
      return "First Name must be at least 2 characters!";
    }
    return null;
  }

  // Function to validate Last Name
  static String? validateLastName(String? lastName) {
    if (lastName == null || lastName.isEmpty) {
      return "Last Name cannot be empty!";
    } else if (lastName.length < 2) {
      return "Last Name must be at least 2 characters!";
    }
    return null;
  }

  //Function to validate Usernames
  static String? validateUserName(String? username) {
    if (username == null || username.isEmpty) {
      return "User Name cannot be empty ";
    } else if (username.length < 2) {
      return "User Name must be at least 2 characters! ";
    }
    return null;
  }

  //Function to validate Passwords

  // Function to validate Password
  static String? validatePassword(String? password) {
    // Check if password is null or empty
    if (password == null || password.isEmpty) {
      return "Password cannot be empty!";
    }

    // Check for minimum length
    if (password.length < 8) {
      return "Password must be at least 8 characters long!";
    }

    // Check if password contains at least one uppercase letter
    if (!password.contains(RegExp(r'[A-Z]'))) {
      return "Password must contain at least one uppercase letter!";
    }

    // Check if password contains at least one lowercase letter
    if (!password.contains(RegExp(r'[a-z]'))) {
      return "Password must contain at least one lowercase letter!";
    }

    // Check if password contains at least one digit
    if (!password.contains(RegExp(r'\d'))) {
      return "Password must contain at least one digit!";
    }

    // Check if password contains at least one special character
    if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return "Password must contain at least one special character!";
    }

    // If all conditions pass, the password is valid
    return null;
  }

  // Function to validate Gender
  static String? validateGender(String? gender) {
    if (gender == null || gender.isEmpty) {
      return "Gender cannot be empty!";
    } else if (gender != "Male" && gender != "Female" && gender != "Other") {
      return "Gender must be Male, Female, or Other!";
    }
    return null;
  }

  // Function to validate Date of Birth
  static String? validateDateOfBirth(DateTime? dateOfBirth) {
    if (dateOfBirth == null) {
      return "Date of Birth cannot be empty!";
    } else if (DateTime.now().year - dateOfBirth.year < 18) {
      return "You must be at least 18 years old!";
    }
    return null;
  }
}

//it is Exmaple How to and Why we use Utilities folder
