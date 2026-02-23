import 'package:local_auth/local_auth.dart';

class AuthService {
  final LocalAuthentication auth = LocalAuthentication();

  Future<bool> authenticate() async {
    bool isAuthenticated = false;

    try {
      isAuthenticated = await auth.authenticate(
        localizedReason: 'We need to authenticate you for using Notium',
        persistAcrossBackgrounding: true,
        sensitiveTransaction: false,
      );
    } on LocalAuthException catch (e) {
      if (e.code == LocalAuthExceptionCode.noBiometricHardware) {
        // Add handling of no hardware here.
      } else if (e.code == LocalAuthExceptionCode.temporaryLockout ||
          e.code == LocalAuthExceptionCode.biometricLockout) {
        // ...
      } else {
        // ...
      }
      isAuthenticated = false;
      print("Error: ${e.toString()}");
    }

    return isAuthenticated;
  }
}
