import 'package:naemansan/screens/course/course_walking_screen.dart';
import 'package:naemansan/screens/courseDetail/course_detail_screen.dart';
import 'package:naemansan/screens/courseDetail/private_course_detail_screen.dart';
import 'package:naemansan/screens/myProfile/my_profile_edit_screen.dart';
import 'package:naemansan/screens/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:naemansan/screens/userProfile/user_profile_screen.dart';

import 'package:naemansan/utilities/style/color_styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Remove splash
    FlutterNativeSplash.remove();

    return GetMaterialApp(
      title: "내만산",
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ko', 'KR'),
      ],
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        useMaterial3: true,
        colorSchemeSeed: ColorStyles.main1,
        // scaffoldBackgroundColor: const Color(0xFFf6f6f8),
      ),
      initialRoute: "/",
      getPages: [
        GetPage(name: '/', page: () => const RootScreen()),
        GetPage(
            name: '/course/walking', page: () => const CourseWalkingScreen()),
        GetPage(
            name: '/courseDetail/:courseId',
            page: () => const CourseDetailScreen()),
        GetPage(
            name: '/privateCourseDetail/:courseId',
            page: () => const PrivateCourseDetailScreen()),
        GetPage(
            name: '/userProfile/:userId',
            page: () => const UserProfileScreen()),
        GetPage(
            name: '/myProfileEdit', page: () => const MyProfileEditScreen()),
      ],
    );
  }
}
