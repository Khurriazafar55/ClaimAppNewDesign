import 'package:camera/camera.dart';
import 'package:claim_core/app_theme_work/light_theme_data.dart';
import 'package:claim_core/splas_screen.dart';
import 'package:flutter/material.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: LightThemeData.light_theme,

      // darkTheme: DarkThemeData.dark_theme,
      themeMode: isDarkMode ? ThemeMode.light : ThemeMode.light,
      home: Scaffold(
        body: ScreenSplash(),
      ),
      // home: ScreenLogin(),
      // home: ScreenDashboard(),
    );
  }
}
