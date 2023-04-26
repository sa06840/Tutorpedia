import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_code/models/parentModel.dart';
import 'package:flutter_code/services/auth/auth_exceptions.dart';
import 'package:flutter_code/services/auth/auth_service.dart';
import 'package:flutter_code/utils/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_code/utils/show_error_dialog.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  // editing Controller
  // final firstNameEditingController = TextEditingController();
  // final secondNameEditingController = TextEditingController();
  // final emailEditingController = TextEditingController();
  // final passwordEditingController = TextEditingController();
  // final confirmPasswordEditingController = TextEditingController();

  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _firstName;
  late final TextEditingController _studentCode;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    _firstName = TextEditingController();
    _studentCode = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _firstName.dispose();
    _studentCode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // first name field
    final firstNameField = TextFormField(
      controller: _firstName,
      enableSuggestions: false,
      autocorrect: false,
      validator: (value) {
        RegExp regex = RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("First Name cannot be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid name(Min. 3 Character)");
        }
        return null;
      },
      onSaved: (value) {
        _firstName.text = value!;
      },
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                style: BorderStyle.solid,
                color: Color.fromARGB(225, 25, 28, 50),
                width: 2.0,
              )),
          hintText: "Full Name"),
    );

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
      onSaved: (value) {
        _email.text = value!;
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

    //student code field
    final studentCodeField = TextFormField(
      controller: _studentCode,
      validator: (value) {
        RegExp regex = RegExp(r"^.{4,}$");
        if (value!.isEmpty) {
          return ("Student Code is required for sign up");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Student Code(Min. 6 Character)");
        }
      },
      onSaved: (value) {
        _studentCode.text = value!;
      },
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              style: BorderStyle.solid,
              color: Color.fromARGB(225, 25, 28, 50),
              width: 2.0,
            )),
        hintText: "Student Code",
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
      onSaved: (value) {
        _password.text = value!;
      },
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
              Color.fromARGB(255, 247, 222, 203),
              Color.fromARGB(255, 235, 235, 235),
              Colors.white,
              Color.fromARGB(255, 244, 169, 203)
            ])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 100.0),
                Image.asset(
                  "assets/images/logo.png",
                  scale: 3.0,
                ),
                SizedBox(height: 20.0),
                Text(
                  "Tutorpedia",
                  style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 25, 28, 50)),
                ),
                // SizedBox(height:20.0),
                Padding(
                  padding: const EdgeInsets.fromLTRB(35.0, 30, 35.0, 0.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        firstNameField,
                        SizedBox(height: 10.0),
                        emailField,
                        SizedBox(height: 10.0),
                        studentCodeField,
                        SizedBox(height: 10),
                        passwordField,
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () async {
                    // final email = _email.text;
                    // final password = _password.text;
                    try {
                      await AuthService.firebase()
                          .createUser(
                            email: _email.text,
                            password: _password.text,
                          )
                          .then((value) => {postDetailsToFirestore()});
                      // postDetailsToFirestore();
                      AuthService.firebase().sendEmailVerification();
                      Navigator.of(context).pushNamed(verifyEmailRoute);
                      // Navigator.of(context).pushNamed(loginRoute);
                    } on WeakPasswordAuthException {
                      await showErrorDialog(context, "Weak Password");
                    } on InvalidEmailAuthException {
                      await showErrorDialog(
                          context, "This is an invalid email address");
                    } on EmailAlreadyInUseAuthException {
                      await showErrorDialog(context, "Email is already in use");
                    } on GenericAuthException {
                      await showErrorDialog(
                        context,
                        'Failed to Register',
                      );
                    }
                  },
                  child: Text(
                    "Sign Up",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 25, 28, 50),
                      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(height: 20.0),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "Already have an Account? ",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color.fromARGB(255, 25, 28, 50),
                          )),
                      TextSpan(
                          text: "Login here!",
                          style: TextStyle(
                            color: Color.fromARGB(255, 25, 28, 50),
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  loginRoute, (route) => false);
                              // Navigator.pop(context);
                            }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  dynamic Progress_bar() {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            // <-- SEE HERE
            title: const Text('Authenticating... Please Wait'),
          );
        });
  }

  void signUp() {
    if (_formKey.currentState!.validate()) {
      Progress_bar();
      Navigator.pushNamed(context, loginRoute);
    }
  }

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    // devtools.log("posting");
    User? user = FirebaseAuth.instance.currentUser;
    ParentModel parentModel = ParentModel();
    // writing all the values
    parentModel.email = user!.email;
    parentModel.uid = user.uid;
    parentModel.firstName = _firstName.text;
    parentModel.studentCode = _studentCode.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(parentModel.toMap());
  }
}
