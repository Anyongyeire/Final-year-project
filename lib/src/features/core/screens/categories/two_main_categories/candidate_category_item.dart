import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../repository/authentication_repository/authentication_repository.dart';
import '../../../controllers/profile_controller.dart';
import '../../dashboard/widgets/grc.dart';
import 'main_candidate_list_page.dart';

AuthenticationRepository authRepo = AuthenticationRepository();

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const CategoryItem(this.id, this.title, this.color, {super.key});

  void selectCategory(BuildContext ctx) async {
    final controller = Get.put(ProfileController());
    // String userEmail = authRepo.getUserEmail;
    if (title == 'Guild Presidents') {
      final userEmail = await controller.getUserData();
      log(userEmail.email);
      // UserModel? userData = snapshot.data as UserModel?;
      Get.to(() => MainCandidateListPage(
            category: 'Guild Presidents',
            voterEmail: userEmail.email,
          ));
    } else if (title == 'Guild Representative Councilors') {
      Get.to(() => const GRC(
            category: 'Guild Representative Councilors',
          ));
    } else {
      Navigator.of(ctx).push(
        MaterialPageRoute(
          builder: (_) {
            return GRC(category: title);
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white, // Set container color
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Set shadow color
                spreadRadius: 0,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.7),
                color,
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            title,
            style: GoogleFonts.tienne(
              fontWeight: FontWeight.w500,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
