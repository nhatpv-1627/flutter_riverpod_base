abstract class AuthRepository {
  Future login(String username, String password);

  Future logout();
}
