import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:schoolapp/google_signin_api.dart';
import 'package:schoolapp/loginpage.dart';
import 'package:http/http.dart' as http;



class Dashboard extends StatelessWidget {
  final GoogleSignInApi _googleAuthService = GoogleSignInApi();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: [
         TextButton(onPressed:() async{
          await GoogleSignInApi.logout;
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => LoginPage()));

         }
         , child:Text("Logout"))
        ],
      ),

      body:Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          ],
        ),
      )
    );
  }
}
