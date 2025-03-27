import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:schoolapp/google_signin_api.dart';
import 'package:schoolapp/loginpage.dart';
import 'package:http/http.dart' as http;



class Dashboard extends StatelessWidget {
  final GoogleSignInApi _googleAuthService = GoogleSignInApi();
  final GoogleSignInAccount user;

  Dashboard({
    Key? key,
    required this.user,}):super(key: key);

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
            Text("Profile"),
            SizedBox(height: 20),
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user.photoUrl!),

            ),
            SizedBox(height: 10),
            Text("Name : "+ user.displayName!,style: TextStyle(color: Colors.black,fontSize: 30)),
            SizedBox(height: 10),
            Text("Email : "+ user.email,style: TextStyle(color: Colors.black,fontSize: 30)),
            SizedBox(height: 10)
            
          ],
        ),
      )
    );
  }
}
