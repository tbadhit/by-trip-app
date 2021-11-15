import 'package:by_trip/ui/pages/home/bookmark_page.dart';
import 'package:by_trip/ui/pages/detail_page.dart';
import 'package:by_trip/ui/pages/edit_profile_page.dart';
import 'package:by_trip/ui/pages/category_page.dart';

import 'package:by_trip/ui/pages/home/explore_page.dart';
import 'package:by_trip/ui/pages/home/main_page.dart';
import 'package:by_trip/ui/pages/home/profile_page.dart';
import 'package:by_trip/ui/pages/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:by_trip/ui/pages/splash_page.dart';
import 'package:by_trip/ui/pages/login_page.dart';
import 'package:by_trip/ui/pages/register_page.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:by_trip/cubit/cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => WisataCubit()),
        BlocProvider(create: (_) => UserCubit()),
        BlocProvider(create: (_) => BookmarkCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/onboarding': (context) => const OnBoardingPage(),
          '/login': (context) => const LoginPage(),
          '/register': (context) => const RegisterPage(),
          '/detail': (context) => const DetailPage(),
          '/profile': (context) => const ProfilePage(),
          '/bookmark': (context) => const BookmarkPage(),
          '/edit-profile': (context) => const EditProfilePage(),
          '/explore': (context) => const ExplorePage(),
          '/category': (context) => CategoryPage(),
          '/main': (context) => const MainPage()
        },
      ),
    );
  }
}
