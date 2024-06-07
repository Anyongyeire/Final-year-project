// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../controllers/profile_controller.dart';
import 'faculty_candidate_list_page.dart';

class FacultyCategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const FacultyCategoryItem(
    this.id,
    this.title,
    this.color, {
    super.key,
  });

  Future<void> selectCategory(BuildContext ctx) async {
    final controller = Get.put(ProfileController());
    final userEmail = await controller.getUserData();
    if (title == 'Faculties') {
      Get.to(() => FacultyCandidateListPage(
            category: 'Faculties',
            voterEmail: userEmail.email,
          ));
    } else if (title == 'Special Interest Groups') {
      Get.to(() => const FacultyCandidateListPage(
            category: 'SIG Categories',
            voterEmail: '',
          ));
    } else {
      Navigator.of(ctx).push(
        MaterialPageRoute(
          builder: (_) {
            return FacultyCandidateListPage(
              category: title,
              voterEmail: userEmail.email,
            );
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    log("in");
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
