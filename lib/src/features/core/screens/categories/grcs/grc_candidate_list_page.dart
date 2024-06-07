import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../controllers/voting_controller.dart';
import '../../../models/grcData.dart';

class GRCCandidateListPage extends StatelessWidget {
  final String category;
  final String voterEmail;

  const GRCCandidateListPage(
      {super.key, required this.category, required this.voterEmail});

  @override
  Widget build(BuildContext context) {
    final VotingController votingController = Get.put(VotingController());
    return Scaffold(
      appBar: AppBar(
        title: Text('$category'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'List of $category candidates',
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    ?.copyWith(fontSize: 18.0, fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: tDefaultSize,
              ),
              FutureBuilder<List<CandidateGRC>>(
                  future: getGRC(category),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<CandidateGRC>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator(); // Show a loading spinner while waiting
                    } else if (snapshot.hasError) {
                      return Text(
                          'Error: ${snapshot.error}'); // Show error message if something went wrong
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data?.length,
                        itemBuilder: (c, index) {
                          return Column(
                            children: [
                              ListTile(
                                iconColor: Colors.blue,
                                tileColor: Colors.blue.withOpacity(0.1),
                                leading: const Icon(LineAwesomeIcons.user_1),
                                title: Text(
                                    "Name: ${snapshot.data![index].nameGRC}"),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "Votes: ${snapshot.data![index].votesGRC}"),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          // Add your onPressed logic here
                                          votingController.submitVote(
                                            context,
                                            voterEmail,
                                            category,
                                            snapshot.data![index].subCategory,
                                            snapshot.data![index].nameGRC,
                                          ); // Call submitVote method from controller
                                        },
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.white,
                                          backgroundColor: Colors
                                              .green, // Set the button's text color
                                          textStyle: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                        child: const Text(
                                          "Vote",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                      );
                    }
                  }),

              // Add more candidates as needed
              const SizedBox(height: 20),
              SizedBox(
                height: 300,
                child: FutureBuilder<List<CandidateGRC>>(
                    future: getGRC(category),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<CandidateGRC>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Text(
                          "Loading...",
                        ); // Show a loading spinner while waiting
                      } else if (snapshot.hasError) {
                        return Text(
                            'Error: ${snapshot.error}'); // Show error message if something went wrong
                      } else {
                        return SfCircularChart(
                          series: <CircularSeries>[
                            PieSeries<CandidateGRC, String>(
                              // Replace with a placeholder type or comment out the code temporarily
                              // ),
                              dataSource: snapshot
                                  .data, // Replace with your data source
                              xValueMapper: (CandidateGRC data, _) =>
                                  data.nameGRC,
                              yValueMapper: (CandidateGRC data, _) =>
                                  data.votesGRC,
                              dataLabelSettings:
                                  const DataLabelSettings(isVisible: true),
                            ),
                          ],
                        );
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
