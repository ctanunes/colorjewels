import 'package:color_jewels_app/screens/stt.dart';
import 'package:flutter/material.dart';
import 'package:color_jewels_app/screens/welcome.screen.dart';
import 'package:color_jewels_app/screens/home.screen.dart';
import 'package:flutter/services.dart';
import 'package:color_jewels_app/screens/tts.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Color Jewels App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: STT(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => WelcomeScreen()),
        GetPage(name: '/new', page: () => HomeScreen()),
        GetPage(
            name: '/home',
            page: () => HomeScreen(),
            transition: Transition.zoom
        ),
      ],
    );
  }
}
