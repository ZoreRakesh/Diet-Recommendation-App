// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last
// import 'package:flutter_application_1/Widgets/text_field_input.dart';
// import 'package:flutter_application_1/utils/colors.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter/material.dart';

// class SignupScreen extends StatefulWidget {
//   const SignupScreen({super.key});

//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _bioController = TextEditingController();
//   final TextEditingController _usernameController = TextEditingController();

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     _bioController.dispose();
//     _usernameController.dispose();
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 32),
//         child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
//           Flexible(
//             child: Container(),
//             flex: 2,
//           ),
//           // svg image
//           SvgPicture.asset(
//             'assets/ic_instagram.svg',
//             color: primaryColor,
//             height: 64,
//           ),
//           const SizedBox(height: 24),
//           // circular widget for accept and show img
//           Stack(
//             children: [
//               CircleAvatar(
//                 radius: 64,
//                 backgroundImage: NetworkImage(
//                     'https://images.unsplash.com/photo-1583484963886-cfe2bff2945f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
//               ),
//               Positioned(
//                 bottom: -10,
//                 left: 80,
//                 child: IconButton(
//                   onPressed: () {},
//                   icon: Icon(Icons.add_a_photo),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 24),

//           // for username
//           TextFieldInput(
//               textEditingController: _usernameController,
//               hintText: "enter your username",
//               textInputType: TextInputType.text),
//           const SizedBox(height: 24),
//           // for email
//           TextFieldInput(
//               textEditingController: _emailController,
//               hintText: "enter your email",
//               textInputType: TextInputType.emailAddress),
//           const SizedBox(height: 24),
//           // for password
//           TextFieldInput(
//             textEditingController: _passwordController,
//             hintText: "enter your password",
//             textInputType: TextInputType.text,
//             isPass: true,
//           ),
//           const SizedBox(height: 24),
//           // for bio
//           TextFieldInput(
//               textEditingController: _bioController,
//               hintText: "enter your bio",
//               textInputType: TextInputType.text),
//           const SizedBox(height: 24),
//           //button
//           InkWell(
//             onTap: () {},
//             child: Container(
//               child: const Text('Sign Up'),
//               width: double.infinity,
//               alignment: Alignment.center,
//               padding: EdgeInsets.symmetric(vertical: 12),
//               decoration: ShapeDecoration(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(4))),
//                 color: blueColor,
//               ),
//             ),
//           ),
//           const SizedBox(height: 12),
//           Flexible(
//             child: Container(),
//             flex: 2,
//           ),
//           //transition to signup
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 child: Text("Already have an account?"),
//                 padding: EdgeInsets.symmetric(vertical: 8),
//               ),
//               GestureDetector(
//                 onTap: () {},
//                 child: Container(
//                   child: Text(
//                     "Log In.",
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   padding: EdgeInsets.symmetric(vertical: 8),
//                 ),
//               )
//             ],
//           )
//         ]),
//       )),
//     );
//   }
// }

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/login_screen.dart';
import 'package:flutter_application_1/Widgets/text_field_input.dart';
import 'package:flutter_application_1/resources/auth_methods.dart';
import 'package:flutter_application_1/responsive/mobile_screen_layout.dart';
import 'package:flutter_application_1/responsive/responsive_layout_screen.dart';
import 'package:flutter_application_1/responsive/web_screen_layout.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
  }

  void signUpUser() async {
    // set loading to true
    setState(() {
      _isLoading = true;
    });

    // signup user using our authmethodds
    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      username: _usernameController.text,
    );
    // if string returned is sucess, user has been created
    if (res == "success") {
      setState(() {
        _isLoading = false;
      });
      // navigate to the home screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
            mobileScreenLayout: MobileScreenLayout(),
            webScreenLayout: WebScreenLayout(),
          ),
        ),
      );
    } else {
      setState(() {
        _isLoading = false;
      });
      // show the error
      showSnackBar(res, context);
    }
  }

  // selectImage() async {
  //   Uint8List im = await pickImage(ImageSource.gallery);
  //   // set state because we need to display the image we selected on the circle avatar
  //   setState(() {
  //     _image = im;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(),
                flex: 2,
              ),
              // SvgPicture.asset(
              //   'assets/ic_instagram.svg',
              //   color: primaryColor,
              //   height: 64,
              // ),
              const SizedBox(height: 64),
              Text(
                "SignUp",
                style: TextStyle(
                    fontSize: 23,
                    color: blueColor,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 44),
              TextFieldInput(
                hintText: 'Enter your username',
                textInputType: TextInputType.text,
                textEditingController: _usernameController,
              ),
              const SizedBox(
                height: 24,
              ),
              TextFieldInput(
                hintText: 'Enter your email',
                textInputType: TextInputType.emailAddress,
                textEditingController: _emailController,
              ),
              const SizedBox(
                height: 24,
              ),
              TextFieldInput(
                hintText: 'Enter your password',
                textInputType: TextInputType.text,
                textEditingController: _passwordController,
                isPass: true,
              ),
              const SizedBox(
                height: 24,
              ),
              TextFieldInput(
                hintText: 'Enter your bio',
                textInputType: TextInputType.text,
                textEditingController: _bioController,
              ),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                child: Container(
                  child: !_isLoading
                      ? const Text(
                          'Sign up',
                        )
                      : const CircularProgressIndicator(
                          color: primaryColor,
                        ),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    color: blueColor,
                  ),
                ),
                onTap: signUpUser,
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text(
                      'Already have an account?',
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    ),
                    child: Container(
                      child: const Text(
                        ' Login.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                ],
              ),
              Flexible(
                child: Container(),
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  showSnackBar(String content, BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(content)));
  }
}
