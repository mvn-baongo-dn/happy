import 'package:happy_app/data/models/account/login/login_request_model.dart';
import 'package:test/test.dart';

void main() {
  group('LoginRequestModel', () {
    test('fromJson should create correct instance from JSON map', () {
      final json = {
        'email': 'test@example.com',
        'password': 'test_password',
      };
      final model = LoginRequestModel.fromJson(json);
      expect(model.email, equals('test@example.com'));
      expect(model.password, equals('test_password'));
    });

    test('toJson should create correct JSON map from instance', () {
      final model = LoginRequestModel(
        email: 'test@example.com',
        password: 'test_password',
      );
      final json = model.toJson();
      expect(json['email'], equals('test@example.com'));
      expect(json['password'], equals('test_password'));
    });
  });
}
