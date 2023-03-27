import 'package:flutter/material.dart';
import 'package:flutter_code/utils/routes.dart';


class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(255, 247, 222, 203),
                  Color.fromARGB(255, 235, 235, 235),
                  Colors.white,
                  Color.fromARGB(255, 244, 169, 203)
                ]
              )
            ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 100.0),
                Image.asset(
                  "assets/images/logo.png",
                  scale: 2.0,
                ),
                SizedBox(height: 20.0),
                Text(
                  "Tutorpedia",
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 25,28,50)
                  ),
                ),
                SizedBox(height:20.0),
                Padding(
                  padding: const EdgeInsets.fromLTRB(35.0, 30, 35.0, 0.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              color: Color.fromARGB(183, 25, 28, 50),
                              width: 2.0,
                            )
                          ),
                          hintText: "Username"
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              color: Color.fromARGB(183, 25,28,50),
                              width: 2.0,
                            )
                          ),
                          hintText: "Password",
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              color: Color.fromARGB(183, 25,28,50),
                              width: 2.0,
                            )
                          ),
                          hintText: "Student Code",
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, MyRoutes.loginRoute);
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 25,28,50),
                    padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  ),
                ),
                SizedBox(height: 50.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}