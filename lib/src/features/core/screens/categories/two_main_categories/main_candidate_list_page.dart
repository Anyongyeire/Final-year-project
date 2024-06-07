import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../constants/sizes.dart';
import '../../../controllers/voting_controller.dart';
import '../../../models/candidatesData.dart';

class MainCandidateListPage extends StatelessWidget {
  final String category;
  final String voterEmail;

  const MainCandidateListPage(
      {super.key, required this.category, required this.voterEmail});

  @override
  Widget build(BuildContext context) {
    final VotingController votingController = Get.put(VotingController());
    // if (Get.find<VotingController>() == null) {
    //   Get.put(VotingController());
    // }
    // final VotingController votingController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$category ',
          style: const TextStyle(
            fontSize: 22.0,
          ),
        ),
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
              const SizedBox(height: tDefaultSize - 10),
              FutureBuilder<List<CandidateData>>(
                  future: getCandidateData(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<CandidateData>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator(); // Show a loading spinner while waiting
                    } else if (snapshot.hasError) {
                      return Text(
                          'Error: ${snapshot.error}'); // Show error message if something went wrong
                    } else {
                      if (voterEmail == '2000809567@std.kyu.ac.ug') {
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
                                      "Name: ${snapshot.data![index].name}"),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "Votes: ${snapshot.data![index].votes}"),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: tDefaultSize - 10),
                              ],
                            );
                          },
                        );
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
                                      "Name: ${snapshot.data![index].name}"),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "Votes: ${snapshot.data![index].votes}"),
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
                                              snapshot.data![index].name,
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
                                ),
                                const SizedBox(height: tDefaultSize - 10),
                              ],
                            );
                          },
                        );
                      }
                    }
                  }),

              // Add more candidates as needed
              const SizedBox(height: 20),
              SizedBox(
                height: 300,
                child: FutureBuilder<List<CandidateData>>(
                    future: getCandidateData(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<CandidateData>> snapshot) {
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
                            PieSeries<CandidateData, String>(
                              // Replace with a placeholder type or comment out the code temporarily
                              // ),
                              dataSource: snapshot
                                  .data, // Replace with your data source
                              xValueMapper: (CandidateData data, _) =>
                                  data.name,
                              yValueMapper: (CandidateData data, _) =>
                                  data.votes,
                              dataLabelSettings:
                                  const DataLabelSettings(isVisible: true),
                              dataLabelMapper: (CandidateData data, _) =>
                                  '${data.name}: ${data.votes}',
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
