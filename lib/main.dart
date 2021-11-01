import 'package:by_trip/ui/pages/bookmark_page.dart';
import 'package:by_trip/ui/pages/detail_page.dart';
import 'package:by_trip/ui/pages/edit_profile_page.dart';
import 'package:by_trip/ui/pages/home/category_page.dart';

import 'package:by_trip/ui/pages/home/explore_page.dart';
import 'package:by_trip/ui/pages/home/main_page.dart';
import 'package:by_trip/ui/pages/home/profile_page.dart';
import 'package:by_trip/ui/pages/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:by_trip/ui/pages/splash_page.dart';
import 'package:by_trip/ui/pages/login_page.dart';
import 'package:by_trip/ui/pages/register_page.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, routes: {
      '/': (context) => const SplashPage(),
      '/onboarding': (context) => OnBoardingPage(),
      '/login': (context) => const LoginPage(),
      '/register': (context) => const RegisterPage(),
      '/detail': (context) => const DetailPage(),
      '/profile': (context) => const ProfilePage(),
      '/bookmark': (context) => BookmarkPage(),
      '/edit-profile': (context) => EditProfilePage(),
      '/explore': (context) => const ExplorePage(),
      '/category': (context) => const CategoryPage(),
      '/main': (context) => MainPage()
    });
  }
}
