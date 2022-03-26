import 'package:biometric_authtentication/App/Snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';

class ViewPageController extends GetxController {
  var _localAuth = LocalAuthentication();
  var hasFingerPrint = false.obs;
  var hasFaceLock = false.obs;
  var isUserAuth = false.obs;
  @override
  void onInit() {
    _getAllBiometrics();
    super.onInit();
  }

  void _getAllBiometrics() async {
    bool hasLocalAuthentication = await _localAuth.canCheckBiometrics;
    if (hasLocalAuthentication) {
      List<BiometricType> availableBiometric =
          await _localAuth.getAvailableBiometrics();
      hasFaceLock.value = availableBiometric.contains(BiometricType.face);
      hasFingerPrint.value =
          availableBiometric.contains(BiometricType.fingerprint);
    } else {
      ShowSnack.showSnackBar(
          title: 'Opps Error',
          message: 'Local Authentication not available',
          backgroundColor: Colors.red);
    }
  }

  void authenticationUser() async {
    try {
      const androidMessage = const AndroidAuthMessages(
        cancelButton: 'Cancel',
        goToSettingsButton: 'Settings',
        goToSettingsDescription: 'Please Set up your FingerPrint',
        biometricHint: 'Verify Your identity',
      );
      isUserAuth.value = await _localAuth.authenticate(
        localizedReason: 'Authentication Yourself',
        biometricOnly: true,
        useErrorDialogs: true,
        stickyAuth: true,
        androidAuthStrings: androidMessage,
      );
      if (isUserAuth.value) {
        ShowSnack.showSnackBar(
            title: "Success",
            message: 'You are authenticated',
            backgroundColor: Colors.green);
      } else {
        ShowSnack.showSnackBar(
            title: 'Error',
            message: 'Authentication Cancelled',
            backgroundColor: Colors.red);
      }
    } catch (e) {
      ShowSnack.showSnackBar(
          title: 'Error', message: e.toString(), backgroundColor: Colors.red);
    }
  }
}
