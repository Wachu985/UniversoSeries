import '../../domain/domain.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource datasource;

  AuthRepositoryImpl({required this.datasource});
  @override
  Future<UserEntity> loginWithEmail({required email, required password}) async {
    return await datasource.loginWithEmail(email: email, password: password);
  }

  @override
  Future<UserEntity> registerWithEmail(
      {required email, required password}) async {
    return await datasource.registerWithEmail(email: email, password: password);
  }

  @override
  Future<UserEntity?> checkSesion() async {
    return await datasource.checkSesion();
  }

  @override
  Future<UserEntity> loginWithGoogle() async {
    return await datasource.loginWithGoogle();
  }

  @override
  Future<UserEntity> registerWithGoogle() async {
    return await datasource.registerWithGoogle();
  }

  @override
  Future<void> logout() async {
    return await datasource.logout();
  }
}
