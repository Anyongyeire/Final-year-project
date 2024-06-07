import 'package:get/get.dart';
import 'package:login_app/src/features/core/screens/dashboard/widgets/dashboard.dart';
import 'package:login_app/src/repository/authentication_repository/authentication_repository.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async {
    var isVerfied = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerfied ? Get.offAll(() => const Dashboard()) : Get.back();
  }
}
