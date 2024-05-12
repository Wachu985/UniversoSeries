import '../entities/entities.dart';

abstract class AuthRepository {
  Future<UserEntity> loginWithEmail({required email, required password});
  Future<UserEntity> registerWithEmail({required email, required password});
  Future<UserEntity?> checkSesion();
  Future<void> logout();

  Future<UserEntity> loginWithGoogle();
  Future<UserEntity> registerWithGoogle();
}
