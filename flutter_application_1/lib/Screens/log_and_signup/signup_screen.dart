// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/Screens/log_and_signup/login_screen.dart';

// import 'package:flutter_application_1/Widgets/text_field_input.dart';
// import 'package:flutter_application_1/resources/auth_methods.dart';
// import 'package:flutter_application_1/responsive/mobile_screen_layout.dart';
// import 'package:flutter_application_1/responsive/responsive_layout_screen.dart';
// import 'package:flutter_application_1/responsive/web_screen_layout.dart';
// import 'package:flutter_application_1/utils/colors.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class SignupScreen extends StatefulWidget {
//   const SignupScreen({Key? key}) : super(key: key);

//   @override
//   _SignupScreenState createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {
//   final TextEditingController _bioController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   bool _isLoading = false;
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _usernameController = TextEditingController();

//   @override
//   void dispose() {
//     super.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     _usernameController.dispose();
//   }

//   void signUpUser() async {
//     // set loading to true
//     setState(() {
//       _isLoading = true;
//     });

//     // signup user using our authmethodds
//     String res = await AuthMethods().signUpUser(
//       email: _emailController.text,
//       password: _passwordController.text,
//       username: _usernameController.text,
//     );
//     // if string returned is sucess, user has been created
//     if (res == "success") {
//       setState(() {
//         _isLoading = false;
//       });
//       // navigate to the home screen
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(
//           builder: (context) => const ResponsiveLayout(
//             mobileScreenLayout: MobileScreenLayout(),
//             webScreenLayout: WebScreenLayout(),
//           ),
//         ),
//       );
//     } else {
//       setState(() {
//         _isLoading = false;
//       });
//       // show the error
//       showSnackBar(res, context);
//     }
//   }

//   showSnackBar(String content, BuildContext context) {
//     ScaffoldMessenger.of(context)
//         .showSnackBar(SnackBar(content: Text(content)));
//   }

//   // selectImage() async {
//   //   Uint8List im = await pickImage(ImageSource.gallery);
//   //   // set state because we need to display the image we selected on the circle avatar
//   //   setState(() {
//   //     _image = im;
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Center(
//         child: SingleChildScrollView(
//           reverse: true,
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 32),
//             width: double.infinity,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 64),
//                 Text(
//                   "SignUp",
//                   style: TextStyle(
//                       fontSize: 23,
//                       color: blueColor,
//                       fontWeight: FontWeight.w900),
//                 ),
//                 const SizedBox(height: 44),
//                 TextFieldInput(
//                   hintText: 'Enter your username',
//                   textInputType: TextInputType.text,
//                   textEditingController: _usernameController,
//                 ),
//                 const SizedBox(
//                   height: 24,
//                 ),
//                 TextFieldInput(
//                   hintText: 'Enter your email',
//                   textInputType: TextInputType.emailAddress,
//                   textEditingController: _emailController,
//                 ),
//                 const SizedBox(
//                   height: 24,
//                 ),
//                 TextFieldInput(
//                   hintText: 'Enter your password',
//                   textInputType: TextInputType.text,
//                   textEditingController: _passwordController,
//                   isPass: true,
//                 ),
//                 const SizedBox(
//                   height: 24,
//                 ),
//                 const SizedBox(
//                   height: 24,
//                 ),
//                 InkWell(
//                   child: Container(
//                     child: !_isLoading
//                         ? const Text(
//                             'Sign up',
//                           )
//                         : const CircularProgressIndicator(
//                             color: primaryColor,
//                           ),
//                     width: double.infinity,
//                     alignment: Alignment.center,
//                     padding: const EdgeInsets.symmetric(vertical: 12),
//                     decoration: const ShapeDecoration(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(4)),
//                       ),
//                       color: blueColor,
//                     ),
//                   ),
//                   onTap: signUpUser,
//                 ),
//                 const SizedBox(
//                   height: 18,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       child: const Text(
//                         'Already have an account?',
//                       ),
//                       padding: const EdgeInsets.symmetric(vertical: 8),
//                     ),
//                     GestureDetector(
//                       onTap: () => Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (context) => const LoginScreen(),
//                         ),
//                       ),
//                       child: Container(
//                         child: const Text(
//                           ' Login.',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         padding: const EdgeInsets.symmetric(vertical: 8),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/home.dart';
import 'package:flutter_application_1/Screens/log_and_signup/welcome_screen.dart';
import 'package:flutter_application_1/responsive/mobile_screen_layout.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../Widgets/my_password_field.dart';
import '../../Widgets/my_text_button.dart';
import '../../Widgets/my_text_field.dart';
import '../../resources/auth_methods.dart';
import '../../utils/colors.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool passwordVisibility = true;
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

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
        MaterialPageRoute(builder: (context) => const MobileScreenLayout()),
      );
    } else {
      setState(() {
        _isLoading = false;
      });
      // show the error
      showSnackBar(res, context);
    }
  }

  showSnackBar(String content, BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(content)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => WelcomePage(),
            ));
          },
          icon: SvgPicture.asset('/back_arrow.svg'),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Register",
                            style: kHeadline,
                          ),
                          Text(
                            "Create new account to get started.",
                            style: kBodyText2,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          MyTextField(
                            hintText: 'Name',
                            inputType: TextInputType.name,
                            controller: _usernameController,
                          ),
                          MyTextField(
                            hintText: 'Email',
                            inputType: TextInputType.emailAddress,
                            controller: _emailController,
                          ),
                          MyPasswordField(
                            isPasswordVisible: passwordVisibility,
                            controller: _passwordController,
                            onTap: () {
                              setState(() {
                                passwordVisibility = !passwordVisibility;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: kBodyText,
                        ),
                        GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          ),
                          child: Text(
                            "Sign In",
                            style: kBodyText.copyWith(
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MyTextButton(
                      buttonName: !_isLoading
                          ? const Text('Register',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ))
                          : const SizedBox(
                              width: 16,
                              height: 16,
                              child: const CircularProgressIndicator(
                                color: primaryColor,
                              ),
                            ),
                      onTap: signUpUser,
                      bgColor: Color.fromARGB(255, 0, 153, 255),
                    ),
                    SizedBox(
                      height: 20,
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
}
