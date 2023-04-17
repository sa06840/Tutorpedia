import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_code/services/auth/auth_exceptions.dart';
import 'package:flutter_code/services/auth/auth_service.dart';
import 'package:flutter_code/utils/routes.dart';
import 'package:flutter_code/utils/show_error_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // // username field
    // final usernameField =  TextFormField(
    //   decoration: InputDecoration(
    //     enabledBorder: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(10.0),
    //       borderSide: BorderSide(
    //         style: BorderStyle.solid,
    //         color: Color.fromARGB(225, 25,28,50),
    //         width: 2.0,
    //       )
    //     ),
    //     hintText: "Username"
    //   ),
    // );

    // // password field
    // final passwordField = TextFormField(
    //   obscureText: true,
    //   decoration: InputDecoration(
    //     enabledBorder: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(10.0),
    //       borderSide: BorderSide(
    //         style: BorderStyle.solid,
    //         color: Color.fromARGB(225, 25,28,50),
    //         width: 2.0,
    //       )
    //     ),
    //     hintText: "Password",
    //   ),
    // );

    // email name
    final emailField = TextFormField(
      controller: _email,
      enableSuggestions: false,
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              style: BorderStyle.solid,
              color: Color.fromARGB(225, 25, 28, 50),
              width: 2.0,
            )),
        hintText: "Email Address",
      ),
    );

    // password field
    final passwordField = TextFormField(
      enableSuggestions: false,
      autocorrect: false,
      controller: _password,
      validator: (value) {
        RegExp regex = RegExp(r"^.{6,}$");
        if (value!.isEmpty) {
          return ("Password is required for sign up");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password(Min. 6 Character)");
        }
      },
      obscureText: true,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              style: BorderStyle.solid,
              color: Color.fromARGB(225, 25, 28, 50),
              width: 2.0,
            )),
        hintText: "Password",
      ),
    );

    return Material(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              Color.fromARGB(255, 244, 169, 203),
              Color.fromARGB(255, 235, 235, 235),
              Colors.white,
              Color.fromARGB(255, 247, 222, 203)
            ])),
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
                      color: Color.fromARGB(255, 25, 28, 50)),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.fromLTRB(35.0, 30, 35.0, 0.0),
                  child: Column(
                    children: [
                      // usernameField,
                      emailField,
                      SizedBox(height: 10.0),
                      passwordField,
                    ],
                  ),
                ),
                SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () async {
                    final email = _email.text;
                    final password = _password.text;
                    try {
                      await AuthService.firebase().logIn(
                        email: email,
                        password: password,
                      );
                      // Navigator.pushNamed(context, dashboardRoute);
                      final user = AuthService.firebase().currentUser;
                      if (user?.isEmailVerified ?? false) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          dashboardRoute,
                          (route) => false,
                        );
                      } else {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          verifyEmailRoute,
                          (route) => false,
                        );
                      }
                    } on UserNotFoundAuthException {
                      await showErrorDialog(
                        context,
                        "user not found",
                      );
                    } on WrongPasswordAuthException {
                      await showErrorDialog(
                        context,
                        "Incorrect Password ",
                      );
                    } on GenericAuthException {
                      await showErrorDialog(
                        context,
                        'Authentication Error',
                      );
                    }
                  },
                  child: Text(
                    "Login",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 25, 28, 50),
                      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(height: 25.0),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "Don't have an Account? ",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color.fromARGB(255, 25, 28, 50),
                          )),
                      TextSpan(
                          text: "Register Now!",
                          style: TextStyle(
                            color: Color.fromARGB(255, 25, 28, 50),
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  signupRoute, (route) => false);
                              // Navigator.pop(context);
                            }),
                    ],
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
