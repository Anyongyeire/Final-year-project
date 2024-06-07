import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../controllers/candidates_list_controller.dart';

class CandidateListPage extends StatelessWidget {
  final CandidatesListController _controller = CandidatesListController();

  CandidateListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Candidate List'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _controller.getCandidatesStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final candidates = snapshot.data!.docs;
            return ListView.builder(
              itemCount: candidates.length,
              itemBuilder: (context, index) {
                if ((candidates[index].data() as Map<String, dynamic>)
                    .containsKey('Category')) {
                  var category = candidates[index]['Category'];
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListTile(
                          iconColor: Colors.blue,
                          tileColor: Colors.blue.withOpacity(0.1),
                          leading: const Icon(LineAwesomeIcons.user_1),
                          title: Text(candidates[index]['FullNames']),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "$category: ${candidates[index]['NameOfPosition']}",
                              ),
                              Text(candidates[index]['SubCategory']),
                            ],
                          ),
                          trailing: IconButton(
                            color: Colors.redAccent,
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              _controller.deleteCandidate(
                                  context,
                                  candidates[index].id,
                                  candidates[index]['FullNames']);
                            },
                          ),
                        ),
                      ),
                      Container(
                        height: 10,
                      ),
                    ],
                  );
                }
                return null;
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return const Center(
              child:
                  CircularProgressIndicator(), // Or any other loading indicator
            );
          }
        },
      ),
    );
  }
}
