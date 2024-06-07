import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EmailLinkSignInPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  EmailLinkSignInPage({super.key});

  Future<void> _sendSignInLink(BuildContext context) async {
    try {
      String email = _emailController.text.trim();
      await FirebaseAuth.instance.sendSignInLinkToEmail(
        email: email,
        actionCodeSettings: ActionCodeSettings(
          url: "https://mobilevoting.page.link/4v3Q?email=$email",
          handleCodeInApp: true,
          iOSBundleId: "com.example.loginApp",
          androidPackageName: "com.example.login_app",
          androidInstallApp: true,
          androidMinimumVersion: "12",
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Sign-in link sent to $email. Please check your email inbox.'),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to send sign-in link: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email Link Sign-In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => _sendSignInLink(context),
              child: const Text('Send Sign-In Link'),
            ),
          ],
        ),
      ),
    );
  }
}
