import 'dart:developer';

import 'package:cinebox/core/result/result.dart';
import 'package:google_sign_in/google_sign_in.dart';

import './google_signin_service.dart';

class GoogleSigninServiceImpl implements GoogleSigninService {
  @override
  Future<Result<String>> isSignedIn() async {
    try {
      final logged = await GoogleSignIn.instance
          .attemptLightweightAuthentication();
      if (logged case GoogleSignInAccount(
        authentication: GoogleSignInAuthentication(:final idToken?),
      )) {
        return Success(idToken);
      }
      return Failure(Exception('User is not signed in'));
    } catch (e, s) {
      log(
        'Authentication failed',
        name: 'GoogleSigninServiceImpl',
        error: e,
        stackTrace: s,
      );
      return Failure(Exception('Authentication failed'));
    }
  }

  @override
  Future<Result<String>> signIn() async {
    try {
      final auth = await GoogleSignIn.instance.authenticate(
        scopeHint: [
          'email',
          'profile',
          'openid',
        ],
      );
      if (auth.authentication case GoogleSignInAuthentication(
        idToken: final idToken?,
      )) {
        return Success(idToken);
      }
      return Failure(Exception('Authentication failed'));
    } catch (e, s) {
      log(
        'Authentication failed',
        name: 'GoogleSigninServiceImpl',
        error: e,
        stackTrace: s,
      );
      return Failure(Exception('Authentication failed'));
    }
  }

  @override
  Future<Result<Unit>> signOut() async {
    try {
      await GoogleSignIn.instance.signOut();
      return successOfUnit();
    } catch (e, s) {
      log(
        'SignOut failed',
        name: 'GoogleSigninServiceImpl',
        error: e,
        stackTrace: s,
      );
      return Failure(Exception('SignOut failed'));
    }
  }
}
