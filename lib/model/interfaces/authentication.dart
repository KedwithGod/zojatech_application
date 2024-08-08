import '../utilities/imports/general_import.dart';

abstract class IAuthService {
  Future<User> login(String email, String password);
  Future<void> logout();
  Future<User> register(String name, String email, String password);
}
