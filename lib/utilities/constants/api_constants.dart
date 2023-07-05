class ApiConstants {
  ApiConstants._();
  // Base Url
  static const String devBaseUrl =
      'https://flask-demo123-fr5hjlk3z-annguyen98.vercel.app/api/dev/';
  static const String stgBaseUrl =
      'https://flask-demo123-4mf1qpq6n-annguyen98.vercel.app/api/stg/';
  static const String prodBaseUrl =
      'https://flask-demo123-annguyen98.vercel.app/api/';

  // Account
  static const String login = '/login';
  static const String logout = '/logout';
  static const refreshToken = '/refresh-token';

  static const List<String> nonAuthenticatedPaths = [
    ApiConstants.login,
  ];
}
