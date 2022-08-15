import 'package:camera/camera.dart';
import 'package:claim_core/app_theme_work/light_theme_data.dart';
import 'package:claim_core/dashboard/screens/screen_dashboard.dart';
import 'package:claim_core/provider/userprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        title: 'Flutter Demo',
        theme: LightThemeData.light_theme,
        themeMode: isDarkMode ? ThemeMode.light : ThemeMode.light,
        home: DashBoardScreen(),
      ),
    );
  }
}
