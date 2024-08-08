
import '../../utilities/imports/general_import.dart';

class MockAuthService implements IAuthService {
  @override
  Future<User> login(String email, String password) async {
    return User(name: 'Mock User', email: email, password: password);
  }

  @override
  Future<void> logout() async {
    // Mock logout logic
  }

  @override
  Future<User> register(String name, String email, String password) async {
    return User(name: name, email: email, password: password);
  }
}
