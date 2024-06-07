import 'package:flutter/material.dart';
import 'package:login_app/src/constants/exporter.dart';

class AboutApp extends StatefulWidget {
  const AboutApp({super.key});

  @override
  State<AboutApp> createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About App ',
          style: TextStyle(
            fontSize: 22.0,
          ),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 200.0,
          child: ElevatedButton(
            child: const Text(
              'About Mobile Voting',
            ),
            onPressed: () => showDialog(
                context: context,
                builder: ((context) => AboutDialog(
                      applicationIcon: ClipRRect(
                        borderRadius: const BorderRadius.all(circularRadius16),
                        child: Image.asset(
                          'assets/images/welcome_images/applogo.png',
                          width: 70.0,
                          // shape: RoundedRectangleBorder(
                          //   borderRadius: BorderRadius.circular(10.0),
                          // ),
                        ),
                      ),
                      applicationLegalese: 'Legalese',
                      applicationName: 'Mobile Voting',
                      applicationVersion: 'version 1.0.0',
                      children: const [
                        Text(
                            "This app was created by Anyongyeire Hezekiah as a final year project.")
                      ],
                    ))),
          ),
        ),
      ),
    );
  }
}
