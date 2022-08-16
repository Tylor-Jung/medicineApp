import 'package:app_project/pages/home_page.dart';
import 'package:app_project/services/app_notification_service.dart';
import 'package:flutter/material.dart';
import 'package:app_project/components/app_themes.dart';

  final notification = AppNotificationService();
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  notification.initializeTimeZone();
  notification.initializeNotification();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppThemes.lightTheme,
      home: const homePage(),
      builder: (context, child) => MediaQuery(
        child: child!,
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      ),
    );
  }
}
