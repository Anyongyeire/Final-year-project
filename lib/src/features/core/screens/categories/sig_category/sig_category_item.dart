import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sig_candidate_list_page.dart';

class SIGCategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const SIGCategoryItem(this.id, this.title, this.color, {super.key});

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return SIGCandidateListPage(category: title);
        },
      ),
    );
    if (title == 'Private Students') {
      Get.to(() => const SIGCandidateListPage(
            category: 'Private Students',
          ));
    } else if (title == 'Government Students') {
      Get.to(() => const SIGCandidateListPage(
            category: 'Government Students',
          ));
    } else if (title == 'Evening Students') {
      Get.to(() => const SIGCandidateListPage(
            category: 'Evening Students',
          ));
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
