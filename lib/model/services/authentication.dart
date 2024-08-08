import '../utilities/imports/general_import.dart';

class AuthService implements IAuthService {

  @override
  Future<User> login(String email, String password) async {
    GeneralResponse response = await networkService.postRequest(
      loginUrl,
      {"email": email, "password": password},
      (data) => (data),
    );
    User $user = User.fromJson(response.data[0]);
    return $user;
  }

  @override
  Future<void> logout() async {
      await networkService.postRequest(
      logoutUrl,
      {},
      (data) => (data),
    );
  }

  @override
  Future<User> register(String name, String email, String password) async {
      GeneralResponse response = await networkService.postRequest(
      registerUpUrl,
     {'name': name, 'email': email, 'password': password},
      (data) => (data),
    );
    User $user = User.fromJson(response.data[0]);
    return $user;
  }
}
