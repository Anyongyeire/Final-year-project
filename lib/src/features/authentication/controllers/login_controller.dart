import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'package:login_app/droidcon_exporter.dart';
import 'package:login_app/src/repository/authentication_repository/authentication_repository.dart';

class LoginController extends GetxController with WidgetsBindingObserver {
  static LoginController get instance => Get.find();

// Textfield  controllers to get data from the text fields
  final email = TextEditingController();
  final pasword = TextEditingController();
  final fullName = TextEditingController();
  final stdNo = TextEditingController();
  final phoneNo = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

// LOADER
  final isLoading = false.obs;

  /// [EmailAndPasswordLogin]
  Future<void> login() async {
    final auth = AuthenticationRepository.instance;
    log(email.text.trim());
    log(pasword.text.trim());
    await auth
        .logInwithEmailAndPassword(email.text.trim(), pasword.text.trim())
        .then((_) {
      Get.snackbar(
        "Success!",
        "You have been successfully loggedin",
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.green,
      );
      auth.setInitialScreen(auth.currentUser);
    }).catchError((error, stackTrace) {
      Get.snackbar(
        "Error",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.red.withOpacity(0.1),
        colorText: Colors.red,
      );
      log(error.toString());
    });
  }

// Call this from Design & it will do the rest
  Future<void> loginUser(String email, String password) async {
    String? error = await AuthenticationRepository.instance
        .logInwithEmailAndPassword(email, password) as String?;
    if (error != null) {
      Get.showSnackbar(GetSnackBar(
        message: error.toString(),
      ));
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    Logger logger = Logger();

    switch (state) {
      case AppLifecycleState.resumed:
        logger.d('LoginController: resumed');
        retrieveDynamicLinkAndSignIn(fromColdState: true);
        break;
      case AppLifecycleState.inactive:
        logger.d('LoginController: inactive');
        break;
      case AppLifecycleState.paused:
        logger.d('LoginController: paused');
        break;
      case AppLifecycleState.detached:
        logger.d('LoginController: detached');
        break;
      case AppLifecycleState.hidden:
        logger.d('LoginController: hidden');
        break;
    }
  }

  Future<void> retrieveDynamicLinkAndSignIn({
    required bool fromColdState,
  }) async {
    throw UnimplementedError();
  }

  /// Passwordless SignIn
  Future<void> sendSignInLink(BuildContext context) async {
    try {
      String emailLink = email.text.trim();
      final auth = AuthenticationRepository.instance;
      await FirebaseAuth.instance.sendSignInLinkToEmail(
        email: emailLink,
        actionCodeSettings: ActionCodeSettings(
          url: "https://mobilevoting.page.link/4v3Q?email=$emailLink",
          handleCodeInApp: true,
          iOSBundleId: "com.example.loginApp",
          androidPackageName: "com.example.login_app",
          androidInstallApp: false,
          androidMinimumVersion: "12",
        ),
      );
      AuthenticationRepository.instance
          .retrieveDynamicLinkAndSignIn(fromColdState: true);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Sign-in link sent to $emailLink. Please check your email inbox.'),
        ),
      );
      // Get.offAll(() => const Dashboard());
      await auth.setInitialScreen(auth.currentUser);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to send sign-in link: $e'),
        ),
      );
    }
  }
}
