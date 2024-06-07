import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login_app/src/constants/colors.dart';
import 'package:login_app/src/constants/exporter.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/features/core/screens/categories/faculties/faculty_category_item.dart';

class Faculty extends StatelessWidget {
  const Faculty({super.key, required String category});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: isDarkMode ? tPrimaryColor : tWhiteColor,
          ),
          backgroundColor: isDarkMode ? tSecondaryColor : tPrimaryColor,
          title: Text(
            tAppName,
            style: Theme.of(context).textTheme.headline4?.copyWith(
                  color: isDarkMode ? tPrimaryColor : tWhiteColor,
                ),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Faculties/Schools",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                FutureBuilder(
                  future: fetchFaculties(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        return const Text(" Error in loading Data!");
                      } else {
                        var faculties = snapshot.data;
                        return SizedBox(
                          height: size.height,
                          child: ListView.builder(
                            itemCount: faculties!.length,
                            itemBuilder: (context, index) {
                              var faculty = faculties[index];
                              return Column(
                                children: [
                                  FacultyCategoryItem(
                                    faculty['id'] ?? 'Unknown',
                                    faculty['Faculty'] ?? 'Unknown',
                                    isDarkMode ? tSecondaryColor : tWhiteColor,
                                  ),
                                  const SizedBox(height: tDefaultSize - 10),
                                ],
                              );
                            },
                          ),
                        );
                      }
                    }

                    return const CircularProgressIndicator(); // Or any other loading indicator
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<List<Map<String, dynamic>>> fetchFaculties() async {
  var collection = FirebaseFirestore.instance.collection('faculties');
  var snapshot = await collection.get();
  return snapshot.docs.map((doc) => doc.data()).toList();
}
