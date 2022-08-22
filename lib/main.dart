import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:camera/camera.dart';
import 'package:claim_core/app_theme_work/light_theme_data.dart';
import 'package:claim_core/login/screens/screen_login.dart';
import 'package:claim_core/provider/userprovider.dart';
import 'package:claim_core/splas_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login/screens/screen_login.dart';

List<CameraDescription>? cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<UserProvider>(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Claim Core',
        theme: LightThemeData.light_theme,
        themeMode: isDarkMode ? ThemeMode.light : ThemeMode.light,
        home: AnimatedSplashScreen(
          splash: const SplashScreen(),
          nextScreen: const LoginScreen(),
          splashTransition: SplashTransition.scaleTransition,

          // 'assets/images/ClaimCore_Logo.png', // use any widget here
          // duration: 3000,
          // child: const Scaffold(
          //  home: LoginScreen(),
          // ),
        ),
      ),
    );
  }
}
