import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:singinwithgoogle/services/google_signin_service.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Auth --Googe'),
          actions: [
            IconButton(
              icon: Icon(FontAwesomeIcons.doorOpen), 
              onPressed: (){
                GoogleSignInService.signOut();
              }
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                MaterialButton(
                  splashColor: Colors.transparent,
                  minWidth: double.infinity,
                  height: 40,
                  color:Colors.red,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.google, color:Colors.white),
                      Text('Sign with Google', style:TextStyle(color:Colors.white, fontSize: 17)),
                    ],
                  ),
                  onPressed: (){
                    //TODO Sign in with google
                    GoogleSignInService.signInWithGoogle();
                    
                  }
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}