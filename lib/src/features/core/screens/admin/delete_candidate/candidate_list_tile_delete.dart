import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'candidates_list_page.dart';

class CandidateListTileDelete extends StatelessWidget {
  const CandidateListTileDelete({super.key});

  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> initialization = Firebase.initializeApp();
    return MaterialApp(
      title: 'Candidate List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CandidateListPage();
          }
          return const CircularProgressIndicator(); // Or any other loading indicator
        },
      ),
    );
  }
}
