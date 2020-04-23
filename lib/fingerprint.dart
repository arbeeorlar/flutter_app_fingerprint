import 'package:local_auth/local_auth.dart';

class  FingerprintClass{


  final LocalAuthentication _localAuthentication = LocalAuthentication();
  String  _authorizedOrNot = "Not authorized";

  // this method checks whether  device has biometric support or not
  Future<bool> getBiometricsSupport() async {

    bool hasFingerPrintSupport = false;
    try {
      hasFingerPrintSupport = await _localAuthentication.canCheckBiometrics;
    } catch (e) {
      print(e);
    }
    return  hasFingerPrintSupport ;
  }


  // this method fetches all the available biometric supports of the device
  Future<List<BiometricType>> getAvailableSupport() async {

    List<BiometricType> availableBuimetricType = List<BiometricType>();
    try {
      availableBuimetricType = await _localAuthentication.getAvailableBiometrics();
    } catch (e) {
      print(e);
    }

    return  availableBuimetricType ;
  }

  //aunthenticate with fingerprint
  Future<String> authenticateMe(String dialogTitle) async {
    bool authenticated = false;
    try {
      authenticated = await _localAuthentication.authenticateWithBiometrics(
        localizedReason: dialogTitle, // message for dialog
        useErrorDialogs: true,// show error in dialog
        stickyAuth: true,// native process
      );
    } catch (e) {
      print(e);
    }

    return _authorizedOrNot = authenticated ? "Authorized" : "Not Authorized";
  }

}