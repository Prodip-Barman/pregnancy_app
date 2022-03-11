import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pregnency_app/pages/change_password.dart';
import 'package:pregnency_app/pages/log_in_page.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final uId = FirebaseAuth.instance.currentUser!.uid;
  final email = FirebaseAuth.instance.currentUser!.email;
  final creationTime = FirebaseAuth.instance.currentUser!.metadata.creationTime;

  User? user = FirebaseAuth.instance.currentUser;

  verifyEmail() async{
    if(user != null && !user!.emailVerified){
      await user!.sendEmailVerification();
      print("Verification Email has been sent");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            'Verification Email has benn sent',
            style: TextStyle(fontSize: 18.0, color: Colors.black),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.green
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: Container(
                      alignment: const Alignment(0.0,4.5),
                      child: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://cdn.pixabay.com/photo/2014/10/10/21/58/earth-483978_960_720.png"
                        ),
                        radius: 60.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                const Text(
                  "ABC"
                  ,style: TextStyle(
                    fontSize: 25.0,
                    color:Colors.blueAccent,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w400
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Card(
                    margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),
                    elevation: 2.0,
                    child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 12,horizontal: 30),
                        child: Text("Edit Profile",style: TextStyle(
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.normal
                        ),))
                ),
                const SizedBox(
                  height: 25,
                ),
                Column(
                  children: [
                    Text(
                      'User ID: $uId',
                      style: const TextStyle(fontSize: 14.0),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Email: $email",
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        user!.emailVerified
                        ? const Text("verified", style: TextStyle(fontSize: 18.0, color: Colors.redAccent),)
                        : TextButton(
                            onPressed: () => {
                              verifyEmail()
                            },
                            child: const Text('Verify Email'))
                      ],
                    ),
                    Text("Created Time : $creationTime"),

                    const SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePassword()));
                    }, child: const Text("Change Password"))
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
}
