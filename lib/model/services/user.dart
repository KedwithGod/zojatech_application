import '../utilities/imports/general_import.dart';

class UserService {
  User? _currentUser;


  // Getter to access the current user
  User? get currentUser => _currentUser;

  // Check if a user is logged in
  bool isLoggedIn() {
    return _currentUser != null;
  }

  // Login and store the user session
  Future<void> login(String email, String password) async {
    try {
      _currentUser = await authService.login(email, password);
      // Optionally, save user data to local storage or secure storage
    } catch (e) {
      rethrow;
    }
  }

  // Logout and clear the user session
  Future<void> logout() async {
    try {
      await authService.logout();
      _currentUser = null;
      // Optionally, clear user data from local storage or secure storage
    } catch (e) {
      rethrow;
    }
  }

  // Register a new user and store the user session
  Future<void> register(String name, String email, String password) async {
    try {
      _currentUser = await authService.register(name, email, password);
      // Optionally, save user data to local storage or secure storage
    } catch (e) {
      rethrow;
    }
  }
}
