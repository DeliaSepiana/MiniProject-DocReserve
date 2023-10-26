import 'package:flutter/material.dart';
import 'package:project/views/history_page.dart';
import 'package:project/views/reservation_page.dart';
import 'package:provider/provider.dart';
import 'package:project/views/home_page.dart';
import 'package:project/views/login_page.dart';
import 'package:project/views/welcome_page.dart';
import 'package:project/viewmodels/login_viewmodel.dart';
import 'package:project/views/schedule_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginViewModel()),
        // Add other providers if needed for other ViewModels
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Doc's Reserve",
        initialRoute: '/',
        routes: {
          '/': (context) => const WelcomePage(),
          '/login': (context) => LoginPage(),
          '/home': (context) => HomePage(),
          '/history': (context) => const HistoryPage(),
          '/schedule': (context) => const ScheduleListPage(),
          '/reservation': (context) => const ReservationPage(),
        },
      ),
    );
  }
}
