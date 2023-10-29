import 'package:flutter/material.dart';
import 'package:project/viewmodels/bottomnavbar_viewmodel.dart';
import 'package:project/views/bottom_navbar.dart';
import 'package:project/views/chatmessage_page.dart';
import 'package:project/views/reservation_page.dart';
import 'package:project/views/welcome_page.dart';
import 'package:provider/provider.dart';
import 'package:project/views/home_page.dart';
import 'package:project/views/login_page.dart';
import 'package:project/viewmodels/login_viewmodel.dart';
import 'package:project/views/schedule_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginViewModel()),
        ChangeNotifierProvider(create: (context) => BottomNavBarViewModel()),
        // ChangeNotifierProvider(create: (context)) => HistoryViewModel()
        // Add other providers if needed for other ViewModels
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Doc's Reserve",
        initialRoute: '/welcome',
        routes: {
          '/': (context) => BottomNavBar(),
          '/welcome': (context) => const WelcomePage(),
          '/login': (context) => LoginPage(),
          '/home': (context) => HomePage(),
          '/history': (context) => const ReservationPage(),
          '/schedule': (context) => const ScheduleListPage(),
          '/reservation': (context) => const ReservationPage(),
          '/chatmessage': (context) => const ChatAi(title: 'Chat AI'),
        },
      ),
    );
  }
}
