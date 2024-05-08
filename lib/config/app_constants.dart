class AppConstants {
  //* All api url constants
  static const String baseUrl = "https://rantdonew.razinsoft.com";
  static const String loginUrl = "$baseUrl/api/login";
  static const String signUpUrl = "$baseUrl/api/signup";
  static const String addNewPostUrl = "$baseUrl/api/post";
  static const String updateProfileUrl = '$baseUrl/api/update-profile';
  static const String forgotPasswordUrl = '$baseUrl/api/forgot-password';
  static const String verifyOtpUrl = '$baseUrl/api/forgot-password/otp/verify';
  static const String resetPasswordUrl = '$baseUrl/api/reset-password';
  static const String allRentsUrl = '$baseUrl/api/all-rents';
  static const String myPostUrl = '$baseUrl/api/my-posts';
  static const String favouritePostUrl = '$baseUrl/api/favorites';
  static const String updateFavouriteStatus = '$baseUrl/api/favorites';
  static const String aboutUsUrl = '$baseUrl/api/legal-pages/about-us';
  static const String postDetails = '$baseUrl/api/rents';
  static const String rentsUrl = '$baseUrl/api/rents';
  static const String privacyPolicyUrl ='$baseUrl/api/legal-pages/privacy-policy';
  static const String termsAndConditionUrl ='$baseUrl/api/legal-pages/terms-and-conditions';
  static const String helpCenterUrl = '$baseUrl/api/contact-us';
  static const String feedbackUrl = '$baseUrl/api/feedback';

  ///* Hive constants
  // Box Names
  static const String appSettingsBox = 'appSettings';
  static const String authBox = 'rentdo_authBox';
  static const String userBox = 'rentdo_userBox';

  // Settings Veriable Names
  static const String appLocal = 'appLocal';
  static const String isDarkTheme = 'isDarkTheme';

  // Auth Variable Names
  static const String authToken = 'token';

  // User variable
  static const String userData = 'userData';

 
}
