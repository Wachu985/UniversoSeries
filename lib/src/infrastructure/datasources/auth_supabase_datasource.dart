import 'package:multi_player/src/domain/domain.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../generated/l10n.dart';
import '../infrastructure.dart';

class AuthSupabaseDatasource implements AuthDatasource {
  final _suprabase = Supabase.instance.client;

  @override
  Future<UserEntity> loginWithEmail({required email, required password}) async {
    final currentUser = _suprabase.auth.currentUser;
    if (_suprabase.auth.currentSession != null) {
      if (currentUser != null) {
        return UserMapper.userModelToUserEntity(currentUser);
      }
    }
    final response = await _suprabase.auth
        .signInWithPassword(email: email, password: password);
    // final Session? session = response.session;
    final User? user = response.user;
    if (user == null) throw Exception(S.current.userNotFound);
    return UserMapper.userModelToUserEntity(user);
  }

  @override
  Future<UserEntity> registerWithEmail(
      {required email, required password}) async {
    final response = await _suprabase.auth.signUp(
      email: email,
      password: password,
      emailRedirectTo: "app.wachu.media://login-callback",
    );
    final User? user = response.user;
    if (user == null) throw Exception(S.current.userNotFound);
    return UserMapper.userModelToUserEntity(user);
  }

  @override
  Future<UserEntity?> checkSesion() async {
    final currentUser = _suprabase.auth.currentUser;
    final currentSession = _suprabase.auth.currentSession;
    if (currentSession != null) {
      if (currentUser != null) {
        _suprabase.auth.refreshSession(currentSession.refreshToken);
        return UserMapper.userModelToUserEntity(currentUser);
      }
    }
    return null;
  }

  @override
  Future<void> logout() async {
    await _suprabase.auth.signOut();
  }

  @override
  Future<UserEntity> loginWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final googleUser = await googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;

      if (accessToken == null) {
        throw S.current.accessTokenNotFound;
      }
      if (idToken == null) {
        throw S.current.idTokenNotFound;
      }
      final response = await _suprabase.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );
      if (response.user == null) throw S.current.googleError;
      return UserMapper.userModelToUserEntity(response.user!);
    } catch (e) {
      throw S.current.googleError;
    }
  }

  @override
  Future<UserEntity> registerWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final googleUser = await googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;

      if (accessToken == null) {
        throw S.current.accessTokenNotFound;
      }
      if (idToken == null) {
        throw S.current.idTokenNotFound;
      }
      final response = await _suprabase.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );
      if (response.user == null) throw S.current.googleError;
      return UserMapper.userModelToUserEntity(response.user!);
    } catch (e) {
      throw S.current.googleError;
    }
  }
}
