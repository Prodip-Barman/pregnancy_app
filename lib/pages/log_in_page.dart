import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pregnency_app/pages/forgot_password.dart';
import 'package:pregnency_app/pages/sign_up_page.dart';
import 'package:pregnency_app/user/user_main.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _formKey = GlobalKey<FormState>();

  var email = "";
  var password = "";
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  userLogIn() async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const UserMain()));
    }on FirebaseAuthException catch(e){
      if(e.code == "user-not-found"){
        print("No user Found for that Email");
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "No user Found for that Email",
              style: TextStyle(fontSize: 16.0, color: Colors.white),
            )));
      }else if(e.code == "wrong-password"){
        print("Wrong Password Provided by User");
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              "Wrong Password Provided by User",
              style: TextStyle(fontSize: 16.0, color: Colors.white),
            )));
      }
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User LogIn"),
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    autofocus: false,
                    decoration: const InputDecoration(
                        label: Text("Email"),
                        labelStyle: TextStyle(fontSize: 20.0),
                        border: OutlineInputBorder(),
                        errorStyle: TextStyle(
                          color: Colors.red,
                          fontSize: 15.0,
                        )),
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Email";
                      } else if (!value.contains("@")) {
                        return "Please enter valid Email";
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    autofocus: false,
                    obscureText: true,
                    decoration: const InputDecoration(
                        label: Text("Password"),
                        labelStyle: TextStyle(fontSize: 20.0),
                        border: OutlineInputBorder(),
                        errorStyle: TextStyle(
                          color: Colors.red,
                          fontSize: 15.0,
                        )),
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Password";
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 60.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                email = emailController.text;
                                password = passwordController.text;
                              });
                              userLogIn();
                            }
                          },
                          child: const Text(
                            "Log In",
                            style: TextStyle(fontSize: 18.0),
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (
                                context) => const ForgotPassword()));
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(fontSize: 14.0),
                          )),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't Have an Account?"),
                    TextButton(onPressed: () {
                      Navigator.pushAndRemoveUntil(context,
                          PageRouteBuilder(pageBuilder: (context, a, b) {
                            return const SignUpPage();
                          }, transitionDuration: const Duration(seconds: 0)), (
                              route) => false);
                    }, child: const Text("Sign Up"),),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
