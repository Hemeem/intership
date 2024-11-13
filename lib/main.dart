import 'package:flutter/material.dart';
import 'package:internship/screen/absen_screen.dart';
import 'package:internship/screen/add_logbook_screen.dart';
import 'package:internship/screen/edit_profile_screen.dart';
import 'package:internship/screen/home_screen.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:internship/screen/logbook_screen.dart';
import 'package:internship/screen/login_page.dart';
import 'package:internship/screen/profile_screen.dart';
import 'package:internship/screen/signup_page.dart';
import 'screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Internship PLN Batam',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/beranda': (context) => HomeScreen(),
        '/absensi': (context) => AbsensiScreen(),
        '/logbook': (context) => LogbookScreen(),
        '/profile': (context) => ProfileScreen(),
        '/editprofile': (context) => EditProfileScreen(),
        '/addlogbook': (context) => AddLogbookScreen(),
      },
    );
  }
}
