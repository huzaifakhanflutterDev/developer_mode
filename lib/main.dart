import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:window_manager/window_manager.dart';

import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
    WindowManager.instance.setMinimumSize(
      Size(380, 650),
    );
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (_, __, ___) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          // themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
          transitionDuration: Duration(milliseconds: 600),
          defaultTransition: Transition.fade,
          theme: ThemeData(
            menuButtonTheme: MenuButtonThemeData(
              style: ButtonStyle(
                overlayColor: WidgetStatePropertyAll(Colors.white),
                shadowColor: WidgetStatePropertyAll(Colors.white),
              ).copyWith(
                elevation: ButtonStyleButton.allOrNull(0),
                overlayColor: WidgetStatePropertyAll(Colors.white),
                shadowColor: WidgetStatePropertyAll(Colors.white),
              ),
            ),
            fontFamily: "Satoshi",
            scaffoldBackgroundColor: Color(0xffFFFFFF),
            appBarTheme: AppBarTheme(
              color: Color(0xff1B8271),
              surfaceTintColor: Color(0xff1B8271),
              centerTitle: true,
              elevation: 0,
            ),
            colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff1B8271)),
            useMaterial3: true,
          ),
          home: LoginScreen(),
        );
      },
    );
  }
}
