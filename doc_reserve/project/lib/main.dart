import 'package:flutter/material.dart';
import 'package:project/views/history_page.dart';
import 'package:provider/provider.dart';
import 'package:project/views/home_page.dart';
import 'package:project/views/login_page.dart';
import 'package:project/views/welcome_page.dart';
import 'package:project/viewmodels/login_viewmodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
          '/': (context) => WelcomePage(),
          '/login': (context) => LoginPage(),
          '/home': (context) => HomePage(),
          '/history': (context) => HistoryPage(),
        },
      ),
    );
  }
}
