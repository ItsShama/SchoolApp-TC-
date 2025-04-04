import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:schoolapp/loginpage.dart';
import 'package:schoolapp/welcomescreen.dart';
import 'package:schoolapp/mobilesignup.dart';
import 'package:schoolapp/chooseboardpage.dart';
import 'package:http/http.dart' as http;
import 'dashboard.dart';
import 'dart:convert';

import 'google_signin_api.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Center(
        child: RichText(
        text: TextSpan(
          text: "Sign Up",
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)))),

            const SizedBox(height: 10),
            Center(
                child: RichText(
                    text: TextSpan(
                        text: "SignUp here to continue to app",
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w100)))),

            const SizedBox(height: 50),
            const Text(
              "Email*",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Enter your email",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(2)),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "Password*",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: passwordController,
              obscureText: !isPasswordVisible,
              decoration: InputDecoration(
                hintText: "Enter your password",
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(2)),
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginPage()),
                  );
                },
                child: const Text("Sign Up",
                    style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2)),
                  side: const BorderSide(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MobileSignup()),
                  );
                },
                child: const Text("Sign up with Mobile Number",
                    style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                    side: const BorderSide(color: Colors.black),
                  ),
                  elevation: 2,
                ),
                onPressed: () async {
                  await signIn(); // Calling signIn method properly with async
                },
                icon: Image.asset(
                  'assets/gmail-logo.jpg',
                  height: 43,
                  width: 43,
                ),
                label: const Text(
                  "Sign Up with Gmail",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: RichText(
                text: TextSpan(
                  text: "Already have an account? ",
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Login",
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        },
                    ),
                  ],
                ),
              ),

            ),

          ],
        ),
      ),
    );
  }
  Future signIn() async {
    final user = await GoogleSignInApi.login();

    if (user == null) {

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Signin Failed")));
      print("failed");
    } else {
      // Get the email from the signed-in user
      final String email = user.email;

      // Send the email to the backend to check if it's already in the database
      final response = await http.post(
        Uri.parse("http://localhost:4000/auth/check-email"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email}),
      );

      if (response.statusCode == 200) {
        print("Successful");
        final data = jsonDecode(response.body);

        // Check the backend response to see if the user should be redirected
        if (data['redirect']) {
          // If redirect is true, it means the user does not exist
          print("Redirecting to Dashboard (new user)");

          // Navigate to the Dashboard page for new user
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Dashboard()) // Replace with actual Dashboard page
          );
        } else {
          // If redirect is false, it means the user already exists
          print("User already exists, redirecting to another page");

          // Redirect to a different screen (e.g., Profile or Welcome page for existing users)
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => WelcomeScreen()) // Replace with your desired page
          );
        }
      } else {
        // If the server returns an error
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Error checking user"))
        );
      }
    }   }
}
