import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/authentication/screens/mail_verification/mail_verification.dart';
import 'package:login_app/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:login_app/src/features/core/screens/dashboard/widgets/dashboard.dart';
import 'package:login_app/src/repository/authentication_repository/exception/signup_email_password_failure.dart';

import '../../features/authentication/screens/splash_screen/splash_screen.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //variables
  late final Rx<User?> _firebaseUser;
  final _auth = FirebaseAuth.instance;
  var verificationId = ''.obs;

  //Getters
  User? get currentUser => _firebaseUser.value;

  String get getUserID => currentUser?.uid ?? "";

  String get getUserEmail => currentUser?.email ?? "";

  get url => getUserEmail;

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
    _firebaseUser.value = _auth.currentUser;
    _firebaseUser.bindStream(_auth.userChanges());
    // FlutterNativeSplash.remove();
    setInitialScreen(_firebaseUser.value);
    // ever(firebaseUser, _setInitialScreen);
  }

  //setting initial screen load
  setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => SplashScreen())
        : user.emailVerified
            // :_auth.currentUser.emailVerified
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
      _firebaseUser.value != null
          ? Get.offAll(() => const Dashboard())
          : Get.offAll(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = TExceptions.fromCode(e.code);
      print("FIREBASE AUTH EXECPTION - ${ex.message}");
      throw ex.message;
    } catch (_) {
      const ex = TExceptions();
      print("FIREBASE AUTH EXECPTION - ${ex.message}");
      throw ex.message;
    }
  }

  /// [Email_Authentication] - LOGIN
  Future<void> logInwithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final result = TExceptions.fromCode(e.code);
      print("FIREBASE AUTH EXECPTION - ${result.message}");
      throw result.message;
    } catch (_) {
      const result = TExceptions();
      print("FIREBASE AUTH EXECPTION - ${result.message}");
      throw result.message;
    }
  }

  /// [Email_Verification] - VERIFICATION
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      final ex = TExceptions.fromCode(e.code);
      print("FIREBASE AUTH EXECPTION - ${ex.message}");
      throw ex.message;
    } catch (_) {
      const ex = TExceptions();
      print("FIREBASE AUTH EXECPTION - ${ex.message}");
      throw ex.message;
    }
  }

  Future<void> logout() async {
    try {
      Get.offAll(() => SplashScreen());
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      throw e.message!;
    } on FormatException catch (e) {
      throw e.message;
    } catch (e) {
      throw 'Unable to logout, Try Again!';
    }
  }

  Future<void> sendEmailLink({
    required String email,
  }) async {
    await _auth.sendSignInLinkToEmail(
        email: email,
        actionCodeSettings: ActionCodeSettings(
          url: 'https://mobilevoting.page.link/4v3Q?email=$email',
          handleCodeInApp: true,
          androidPackageName: 'com.example.login_app',
          iOSBundleId: 'com.example.loginApp',
        ));
    Get.snackbar("Success", "Email Link sent successfully");
  }

  /// Cold state means the app was terminated
  Future<void> retrieveDynamicLinkAndSignIn({
    required bool fromColdState,
  }) async {
    try {
      PendingDynamicLinkData? dynamicLinkData;

      if (fromColdState) {
        dynamicLinkData = await FirebaseDynamicLinks.instance.getInitialLink();
      } else {
        dynamicLinkData = await FirebaseDynamicLinks.instance.onLink.first;
      }
      if (dynamicLinkData == null) {
        Get.snackbar(
          "Oops!",
          'No Credentials were found',
        );
      }
      bool validLink =
          _auth.isSignInWithEmailLink(dynamicLinkData!.link.toString());
      if (validLink) {
// Get the user's Url from the continueurl
        final continueUrl =
            dynamicLinkData.link.queryParameters['continueUrl'] ?? "";
        // var url = FirebaseAuth.instance.currentUser;
        final email = url.parse(continueUrl).queryParameters['email'] ?? "";
        final UserCredential userCredential = await _auth.signInWithEmailLink(
          email: email,
          emailLink: dynamicLinkData.link.toString(),
        );
              setInitialScreen(_auth.currentUser);

        if (userCredential.user != null) {
          Get.snackbar(
            "Success",
            'Signed in successfully',
          );
        } else {
          Get.snackbar(
            "Oh! Snap",
            'Not able to signin',
          );
        }
      } else {
        Get.snackbar(
          "Oh! Snap",
          'Link is not valid',
        );
      }
    } catch (e) {
      Get.snackbar(
        "Oh! Snap",
        'Something went wrong...',
      );
    }
  }
}



// try{  




 
