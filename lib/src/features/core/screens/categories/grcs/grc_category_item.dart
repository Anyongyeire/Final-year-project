import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../dashboard/widgets/faculty.dart';
import '../../dashboard/widgets/sig.dart';

class GRCCategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const GRCCategoryItem(this.id, this.title, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    log("in");
    void selectCategory(BuildContext ctx) {
      if (title == 'Faculties') {
        Get.to(() => const Faculty(
              category: 'Faculties',
            ));
      } else if (title == 'Special Interest Groups') {
        Get.to(() => const SIG(
              category: 'SIG Categories',
            ));
      } else {
        Navigator.of(ctx).push(
          MaterialPageRoute(
            builder: (_) {
              return Faculty(category: title);
            },
          ),
        );
      }
    }

    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: SizedBox(
        width: double.infinity,
        height: 70,
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
