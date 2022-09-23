import 'package:mangadex_mobile/models/user.dart';

class AuthState {
  late bool isLoading;
  late bool isAuthenticated;
  User? user;
  String? error;

  AuthState() {
    isLoading = false;
    isAuthenticated = false;
  }

  AuthState.loading() {
    isLoading = true;
  }

  AuthState.success(this.user, this.isAuthenticated) {
    isLoading = false;
  }

  AuthState.error(this.error) {
    isLoading = false;
  }
}
