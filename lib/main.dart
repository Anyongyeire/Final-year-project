// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:login_app/firebase_options.dart';
import 'package:login_app/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:login_app/src/repository/authentication_repository/authentication_repository.dart';
import './src/features/authentication/screens/splash_screen/splash_screen.dart';
import './src/utils/theme/theme.dart';

// Future<void> main() async {
//   WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

//   FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
//       .then((value) => Get.put(AuthenticationRepository()));
//   runApp(
//     const MyApp(),
//   );
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));

  //Handle Incoming Links
  // FirebaseDynamicLinks.instance.onLink(
  //   onSuccess: (PendingDynamicLinkData? dynamicLink) async {
  //     final Uri? deepLink = dynamicLink.link;
  //     if (deepLink != null) {
  //       // Handle the deep link, e.g sign in the user
  //       print('Handling dynamic link: $dynamicLink');
  //     }
  //     onError:
  //     (OnLinkErrorException e) async {
  //       print('Error handling dynamic link: ${e.message}');
  //     };
  //   },
  // );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
      home: SplashScreen(),
      onGenerateRoute: Router.generateRoute,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text(".appable/"),
        leading: const Icon(Icons.ondemand_video_outlined),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_shopping_cart_outlined),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Text(
              'Heading',
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              'Sub-heading',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Text(
              'Paragraph',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Elevated Button'),
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Outlined Button'),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Image(
                image: AssetImage("assets/images/books1.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/welcome-screen-page':
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
