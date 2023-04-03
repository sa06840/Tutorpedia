import 'package:flutter/material.dart';
import 'package:flutter_code/screens/dashboard.dart';
import 'package:flutter_code/screens/login_screen.dart';
import 'package:flutter_code/screens/signup_screen.dart';
import 'package:flutter_code/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      // debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      // initialRoute: "/",
      routes: {
        "/": (context) => SignupScreen(),
        MyRoutes.signupRoute: (context) => SignupScreen(),
        MyRoutes.dashboardRoute: (context) => DashBoard(),
        MyRoutes.loginRoute: (context) => LoginScreen(),
      },
    );
  }
}