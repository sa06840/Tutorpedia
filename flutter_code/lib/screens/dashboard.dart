// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_code/services/auth/auth_service.dart';
import 'package:flutter_code/utils/routes.dart';
import 'package:flutter_code/widgets/announcementsSlider.dart';
import 'package:flutter_code/models/announcementsModel.dart';
import 'package:flutter_code/widgets/attendanceAssignments.dart';
import 'package:flutter_code/widgets/attendanceCounter.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final className = Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 36.0),
        child: Text(
          "CLASS NAME",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
      ),
    );

    final image = Container(
      width: 120.0,
      height: 120.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage("assets/images/logo.png"),
          fit: BoxFit.cover,
        ),
      ),
    );

    final studentName = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "Student Name",
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
    );

    return Material(
      child: Container(
        decoration: BoxDecoration(
            // color: Color.fromARGB(255, 243,243,247)
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              Color.fromARGB(255, 244, 169, 203),
              Color.fromARGB(255, 235, 235, 235),
              Colors.white,
              Color.fromARGB(255, 247, 222, 203),
            ])),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 50, 0.0, 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [],
                      ),
                    ),
                    SizedBox(height: 25.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        className,
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: IconButton(
                              onPressed: () async {
                                // Navigator.pop(context);
                                final shouldLogout =
                                    await showLogoutDialog(context);
                                if (shouldLogout) {
                                  await AuthService.firebase().logOut;
                                 
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      loginRoute, (route) => false);
                                }
                              },
                              icon: Icon(
                                Icons.logout_rounded,
                                size: 35,
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: 18.0),
                    Column(
                      children: [
                        image,
                        studentName,
                        Text(
                          "Student",
                          style: TextStyle(
                              fontSize: 15.0, color: Colors.grey[600]),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 18.0,
                    ),
                    AnnoucementsSlider(),
                    AttendanceAssignments(),
                  ]),
            )),
      ),
    );
  }
}

enum MenuAction { logout }

Future<bool> showLogoutDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Sign out"),
        content: const Text("Are you sure you want to sign out?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text("Cancel "),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text("Logout "),
          ),
        ],
      );
    },
  ).then((value) => value ?? false);
}
