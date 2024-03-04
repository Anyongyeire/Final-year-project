import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/authentication/screens/mail_verification/mail_verification.dart';
import 'package:login_app/src/features/authentication/screens/on_bording/on_bording_screen.dart';
import 'package:login_app/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:login_app/src/features/core/screens/dashboard/widgets/dashboard.dart';
import 'package:login_app/src/repository/authentication_repository/exception/signup_email_password_failure.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser = Rx<User?>(null);
  var verificationId = ''.obs;

  //Getters
  User? get currentUser => firebaseUser.value;

  String get getUserID => currentUser?.uid ?? "";

  String get getUserEmail => currentUser?.email ?? "";

  // @override
  // void onReady() {
  //   _firebaseUser = Rx<User?>(_auth.currentUser);
  //   _firebaseUser.bindStream(_auth.userChanges());
  //   FlutterNativeSplash.remove();
  //   _setInitialScreen(_firebaseUser.value);
  //   // ever(firebaseUser, _setInitialScreen);
  // }

  @override
  void onReady() {
    firebaseUser.value = _auth.currentUser;
    firebaseUser.bindStream(_auth.userChanges());
    // FlutterNativeSplash.remove();
    setInitialScreen(firebaseUser.value);
    // ever(firebaseUser, _setInitialScreen);
  }

  //setting initial screen load
  setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => OnBordingScreen())
        : user.emailVerified
            ? Get.offAll(() => const Dashboard())
            : Get.offAll(() => const MailVerification());
  }

  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },
      codeSent: ((verificationId, resendToken) {
        this.verificationId.value = verificationId;
      }),
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
      verificationFailed: (e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar("Error", "The provided phone number is not valid!");
        } else {
          Get.snackbar('Error', 'Oops! Something went wrong, Try again!');
        }
      },
    );
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials =
        await _auth.signInWithCredential(PhoneAuthProvider.credential(
      verificationId: verificationId.value,
      smsCode: otp,
    ));
    return credentials.user != null ? true : false;
  }

  /// [Email_Authentication] - REGISTER
  Future<void> createUserwithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const Dashboard())
          : Get.offAll(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = TExceptions.fromCode(e.code);
      print("FIREBASE AUTH EXECPTION - ${ex.message}");
      throw ex;
    } catch (_) {
      const ex = TExceptions();
      print("FIREBASE AUTH EXECPTION - ${ex.message}");
      throw ex;
    }
  }

  /// [Email_Authentication] - LOGIN
  Future<void> logInwithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final result = TExceptions.fromCode(e.code);
      throw result.message;
    } catch (_) {
      const result = TExceptions();
      throw result.message;
    }
  }

  /// [Email_Verification] - VERIFICATION
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      final ex = TExceptions.fromCode(e.code);
      throw ex.message;
    } catch (_) {
      const ex = TExceptions();
      throw ex.message;
    }
  }

  Future<void> logout() async => await _auth.signOut();
}
