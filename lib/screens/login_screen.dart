import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_interview/screens/home_screen.dart';
import 'package:flutter_interview/screens/sign_up_screen.dart';
import 'package:flutter_interview/widgets/buttons.dart';
import '../widgets/signin_login_text_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final _auth = FirebaseAuth.instance;

class _LoginScreenState extends State<LoginScreen> {
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 40.0,
            bottom: 10.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Login',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 45,
                child: TextField(
                  onChanged: (value) {
                    email = value;
                    //Do something with the user input.
                  },
                  decoration: InputDecoration(
                    hintText: 'enter your mail',
                    hintStyle: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                    prefixIcon: Icon(Icons.email),
                    enabledBorder: border(color: Color(0xFFBDBDBD)),
                    focusedBorder: border(color: Color(0xFF19731C)),
                    contentPadding: const EdgeInsets.all(0),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 45,
                child: TextField(
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    password = value;
                    //Do something with the user input.
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'enter your password',
                    hintStyle: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                    prefixIcon: Icon(Icons.password_rounded),
                    enabledBorder: border(color: Color(0xFFBDBDBD)),
                    focusedBorder: border(color: Color(0xFF19731C)),
                    contentPadding: const EdgeInsets.all(10),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Buttons(
                  onPress: () async {
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email!, password: password!);
                      if (user != null) {
                        Navigator.pop(context,true);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                      }
                    } catch (e) {
                      CircularProgressIndicator();
                    }
                  },
                  label: 'Login'),
              const Spacer(),
              //custom Widget
              SignupLoginTextButton(
                text: 'Don\'t have an Account ',
                labelButton: 'SignUp',
                onPress: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupScreen()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

OutlineInputBorder border({required Color color}) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(
        color: color,
        width: .8,
      ));
}
