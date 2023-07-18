import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../resources/auth_methods.dart';
import '../utils/colors.dart';
import 'log_and_signup/login_screen.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({super.key});

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  String? username;
  String? email;
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      setState(() {
        username = (userSnap.data() as Map<String, dynamic>)['username'];
        email = (userSnap.data() as Map<String, dynamic>)['email'];
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bodyColor,
      body: SafeArea(
          child: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          // ignore: sort_child_properties_last
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.symmetric(vertical: 25),
                  child: Column(
                    children: [
                      // Container(
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(50),
                      //     color: Color.fromARGB(255, 206, 96, 96),
                      //   ),
                      //   clipBehavior: Clip.hardEdge,
                      //   height: 100,
                      //   width: 100,
                      //   child: Image(
                      //       fit: BoxFit.cover,
                      //       image: NetworkImage(
                      //           'https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80')),
                      // ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        '$username',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        height: 5,
                      ),

                      Text(
                        '$email',
                        style: TextStyle(fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              //   decoration: BoxDecoration(
              //       color: Color.fromARGB(255, 82, 238, 87),
              //       borderRadius: BorderRadius.circular(20)),
              //   child: Text(
              //     'User Stats',
              //     style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              //   ),
              // ),
              // SizedBox(
              //   height: 15,
              // ),
              InkWell(
                onTap: () async {
                  await AuthMethods().signOut();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 36, vertical: 10),
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      color: activeCardColor,
                      borderRadius: BorderRadius.circular(7)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Sign Out ',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                      Icon(
                        Icons.logout,
                        size: 15,
                        weight: 600,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 22,
          ),
        ),
      )),
    );
  }
}
