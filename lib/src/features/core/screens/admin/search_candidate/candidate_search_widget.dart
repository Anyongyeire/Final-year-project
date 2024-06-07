import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/sizes.dart';
import '../../../controllers/candidates_search_controller.dart';

class CandidateSearchWidget extends StatelessWidget {
  final CandidateSearchController _controller = CandidateSearchController();
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  CandidateSearchWidget({super.key});

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Candidate'),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: _initialization,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(tDefaultSize),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            controller: _controller.searchController,
                            decoration: const InputDecoration(
                              labelText: 'Candidates Name',
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                _controller.searchUser(context);
                              },
                              child: const Text('Search'),
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text('Edit'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}
