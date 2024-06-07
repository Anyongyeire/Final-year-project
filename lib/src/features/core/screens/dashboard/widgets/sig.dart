import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:login_app/src/constants/colors.dart';
import 'package:login_app/src/constants/exporter.dart';
import 'package:login_app/src/constants/sizes.dart';
import '../../categories/sig_category/sig_category_item.dart';

class SIG extends StatelessWidget {
  const SIG({super.key, required String category});

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
                  "SIG Categories",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: tDefaultSize - 10,
                ),
                FutureBuilder(
                  future: fetchSIG(),
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
                                  SIGCategoryItem(
                                    faculty['id'] ?? 'Unknown',
                                    faculty['Group'] ?? 'Unknown',
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

Future<List<Map<String, dynamic>>> fetchSIG() async {
  var collection = FirebaseFirestore.instance.collection('sig');
  var snapshot = await collection.get();
  return snapshot.docs.map((doc) => doc.data()).toList();
}
