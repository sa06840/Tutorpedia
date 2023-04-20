// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_code/screens/announcementDetails.dart';
import 'package:flutter_code/screens/announcementsScreen.dart';
import 'package:flutter_code/screens/assignments_corrections.dart';
import 'package:flutter_code/screens/dashboard.dart';
import 'package:flutter_code/screens/login_screen.dart';
import 'package:flutter_code/screens/signup_screen.dart';
import 'package:flutter_code/screens/verify_email_view.dart';
import 'package:flutter_code/services/auth/auth_service.dart';
import 'package:flutter_code/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:firebase_core/firebase_core.dart'; 
import 'firebase_options.dart';
import 'dart:developer' as devtools show log;

// void main() {
//   runApp(MyApp());
// }

// void main() async {
//    WidgetsFlutterBinding.ensureInitialized();
//    await Firebase.initializeApp();
//    runApp(MyApp());
// }
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       themeMode: ThemeMode.light,
//       theme: ThemeData(
//         primarySwatch: Colors.deepPurple,
//         fontFamily: GoogleFonts.lato().fontFamily,
//       ),
//       // debugShowCheckedModeBanner: false,
//       darkTheme: ThemeData(
//         brightness: Brightness.dark,
//       ),
//       // initialRoute: "/",
//       // home: const HomePage(),
//       routes: {
//         "/": (context) => LoginScreen(),
//         signupRoute: (context) => SignupScreen(),
//         dashboardRoute: (context) => DashBoard(),
//         loginRoute: (context) => LoginScreen(),
//         verifyEmailRoute: (context) => VerifyEmailView(),
//       },
//     );
//   }
// }
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
    home: const HomePage(),
    routes: {
       signupRoute: (context) => SignupScreen(),
        dashboardRoute: (context) => DashBoard(),
        loginRoute: (context) => LoginScreen(),
        verifyEmailRoute: (context) => VerifyEmailView(),
        // announcementsRoute: (context) => AnnouncementsScreen(),
        // announcementDetailsRoute: (context) => AnnouncementDetails(),
    },
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AuthService.firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = (AuthService.firebase().currentUser);
            devtools.log(user.toString());
            if (user != null) {
              if (user.isEmailVerified) {
                return const DashBoard();
              } else {
                return const VerifyEmailView();
              }
            } else {
              // return const VerifyEmailView();
              return const LoginScreen();
            }
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}


// class NotesView extends StatefulWidget {
//   const NotesView({super.key});

//   @override
//   State<NotesView> createState() => _NotesViewState();
// }

// enum MenuAction { logout }

// class _NotesViewState extends State<NotesView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Main UI"),
//         actions: [
//           PopupMenuButton<MenuAction>(
//             onSelected: (value) async {
//               switch (value) {
//                 case MenuAction.logout:
//                   final shouldLogout = await showLogoutDialog(context);
//                   if (shouldLogout) {
//                     await FirebaseAuth.instance.signOut();
//                     Navigator.of(context)
//                         .pushNamedAndRemoveUntil(loginRoute, (_) => false);
//                   }
//                   break;
//               }
//             },
//             itemBuilder: (context) {
//               return const [
//                 PopupMenuItem<MenuAction>(
//                   value: MenuAction.logout,
//                   child: Text("Logout"),
//                 ),
//               ];
//             },
//           )
//         ],
//       ),
//       body: const Text("Hello world"),
//     );
//   }
// }


