import 'package:get/get.dart';
import 'package:login_app/src/repository/authentication_repository/authentication_repository.dart';

import '../../../repository/user_repository/user_repository.dart';
import '../../authentication/models/user_model.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  // Repositories
  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  // Get User Email and pass to UserRepository to fetch user record
  getUserData() async {
    final email = _authRepo.currentUser?.email;
    // final email = _authRepo.getUserEmail;

    if (email != null) {
      return await _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("Error", "Login to Continue");
    }
    return email;
  }

  Future<List<UserModel>> getAllUser() async {
    return await _userRepo.allUser();
  }

  Future<List<Object>> getAllUsersData() async {
    return await _userRepo.getData();
  }

  UpdateRecord(UserModel user) async {
    await _userRepo.updateUserRecord(user);
  }
}
