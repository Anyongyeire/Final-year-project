import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:login_app/droidcon_exporter.dart';
import 'package:login_app/src/features/authentication/controllers/signup_controller.dart';
import 'package:login_app/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:login_app/src/features/core/screens/dashboard/widgets/dashboard.dart';
import 'package:login_app/src/repository/authentication_repository/exception/signup_email_password_failure.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const WelcomeScreen())
        : Get.offAll(() => const Dashboard());
  }

  Future<void> createUserwithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const Dashboard())
          : Get.offAll(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print("FIREBASE AUTH EXECPTION - ${ex.message}");
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      print("FIREBASE AUTH EXECPTION - ${ex.message}");
      throw ex;
    }
  }

  Future<void> logInwithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
    } catch (_) {}
  }

  Future<void> logout() async => await _auth.signOut();
}
