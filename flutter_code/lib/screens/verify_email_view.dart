import 'package:flutter/material.dart';
import 'package:flutter_code/services/auth/auth_service.dart';
import 'package:flutter_code/utils/routes.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Verify Email")),
      body: Column(
        children: [
          Image.asset(
            'assets/images/verify_email.png',
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          const SizedBox(height: 24.0),
        
          const Text(
              "We've sent you an email verfication. Please open it to verify your account."),
          const Text(
              "If you havent received a verfication email yet, press the button below"),
          TextButton(
            onPressed: () async {
              await AuthService.firebase().sendEmailVerification();
            },
            child: const Text("Re-send email verfication"),
          ),
          TextButton(
              onPressed: () async {
                await AuthService.firebase().logOut();
                
                // Navigator.of(context).pushNamedAndRemoveUntil(
                //   registerRoute,
                //   (route) => false,
                // );
                Navigator.of(context).pushNamedAndRemoveUntil(
                  loginRoute,
                  (route) => false,
                );
              },
              child: const Text("Continue to Login")),
        ],
      ),
    );
  }
}
