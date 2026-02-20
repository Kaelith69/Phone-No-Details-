/// Application-wide configuration constants.
///
/// ⚠️  SECURITY NOTE: In a production application, API keys should never be
/// embedded in source code.  Use a secrets manager, CI/CD environment
/// variables, or a platform-specific secrets store instead, and add any
/// local config files to `.gitignore`.
class AppConfig {
  AppConfig._();

  /// APILayer number-verification API key.
  ///
  /// Replace this placeholder with your own key obtained from
  /// https://apilayer.com/marketplace/number_verification-api
  static const String apiKey = 'YOUR_API_KEY_HERE';

  /// Base URL for the phone-number validation endpoint.
  static const String baseUrl =
      'https://api.apilayer.com/number_verification/validate';
}
