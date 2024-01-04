import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:photospot/firebase_options.dart';
import 'package:photospot/view/error_screen.dart';
import 'package:photospot/view/gallery_view.dart';
import 'package:photospot/view/home_screen.dart';
import 'package:photospot/view/video_screen.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const PhotoSpot());
}

class PhotoSpot extends StatelessWidget {
  const PhotoSpot({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Spot',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.grey,
      ),
      // home: HomeScreen(),
      onGenerateRoute: (settings) {
        final uri = Uri.parse(settings.name!);
        if (uri.pathSegments.length == 2 && uri.pathSegments[0] == 'gallery') {
          final refName = uri.pathSegments[1];
          return MaterialPageRoute(
              builder: (_) => GalleryView(refName: refName));
        }
        // Handle unknown routes here if needed
        return MaterialPageRoute(builder: (_) => ErrorScreen());
      },
      routes: {
        '/': (context) => HomeScreen(),
        '/gallery/:refName': (context) {
          final Map<String, dynamic> args = ModalRoute.of(context)!
              .settings
              .arguments as Map<String, dynamic>;
          final refName = args['refName'];
          return GalleryView(refName: refName);
        },
        VideoScreen.routeName: (context) {
          Object? args = ModalRoute.of(context)?.settings.arguments;
          if (args != null && args is String) {
            return VideoScreen(
              url: args,
            );
          } else {
            return ErrorScreen();
          }
        }
      },
    );
  }
}
