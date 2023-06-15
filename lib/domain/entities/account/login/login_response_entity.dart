class LoginResponseEntity {
  const LoginResponseEntity({
    required this.email,
    required this.accessToken,
    required this.refreshToken,
  });

  final String email;

  final String accessToken;

  final String refreshToken;
}
