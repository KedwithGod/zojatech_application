import 'package:flutter_test/flutter_test.dart';

import 'package:zojatech_app/model/utilities/imports/general_import.dart';


void main() {
  late IAuthService authService;

  setUp(() {
    authService = MockAuthService();
  });

  test('Login', () async {
    // Arrange
    String email = 'test@example.com';
    String password = 'password';

    // Act
    User user = await authService.login(email, password);

    // Assert
    expect(user.email, email);
    expect(user.password, password);
    expect(user.name, 'Mock User');
  });

  test('Logout', () async {
    // Act
    await authService.logout();

    // Assert
    // No specific assertion for logout as it's mocked
  });

  test('Register', () async {
    // Arrange
    String name = 'New User';
    String email = 'newuser@example.com';
    String password = 'newpassword';
  

    // Act
    User user = await authService.register(name, email, password);

    // Assert
    expect(user.name, name);
    expect(user.email, email);
    expect(user.password, password);
  });
}
