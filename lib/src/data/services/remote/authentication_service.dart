import '../../models/user.dart';

class AuthenticationService {
  Future<User?> login(String rfc, String email) async {
    await Future.delayed(
        const Duration(seconds: 2)); // esta parte simula la petición a una api
    if (email == 'test@test.com' && rfc == 'EIGA800318FE6') {
      return User(
          email: 'test@test.com',
          rfc: 'EIGA800318FE6',
          name: 'Arturo',
          lastName: 'Espinosa');
    }
    return null;
  }
}
