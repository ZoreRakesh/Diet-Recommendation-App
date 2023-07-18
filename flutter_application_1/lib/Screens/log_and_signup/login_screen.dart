// // ignore_for_file: sort_child_properties_last

// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/Screens/log_and_signup/signup_screen.dart';
// import 'package:flutter_application_1/Widgets/text_field_input.dart';
// import 'package:flutter_application_1/resources/auth_methods.dart';
// import 'package:flutter_application_1/responsive/mobile_screen_layout.dart';
// import 'package:flutter_application_1/responsive/responsive_layout_screen.dart';
// import 'package:flutter_application_1/responsive/web_screen_layout.dart';
// import 'package:flutter_application_1/utils/colors.dart';
// import 'package:flutter_application_1/utils/dimensions.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   bool _isLoading = false;

//   @override
//   void dispose() {
//     super.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//   }

//   showSnackBar(String content, BuildContext context) {
//     ScaffoldMessenger.of(context)
//         .showSnackBar(SnackBar(content: Text(content)));
//   }

//   void loginUser() async {
//     setState(() {
//       _isLoading = true;
//     });
//     String res = await AuthMethods().loginUser(
//         email: _emailController.text, password: _passwordController.text);
//     if (res == 'success') {
//       Navigator.of(context).pushAndRemoveUntil(
//           MaterialPageRoute(
//             builder: (context) => const ResponsiveLayout(
//               mobileScreenLayout: MobileScreenLayout(),
//               webScreenLayout: WebScreenLayout(),
//             ),
//           ),
//           (route) => false);

//       setState(() {
//         _isLoading = false;
//       });
//     } else {
//       setState(() {
//         _isLoading = false;
//       });
//       showSnackBar(res, context);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Center(
//         child: Container(
//           child: SingleChildScrollView(
//             reverse: true,
//             child: Container(
//               padding: MediaQuery.of(context).size.width > webScreenSize
//                   ? EdgeInsets.symmetric(
//                       horizontal: MediaQuery.of(context).size.width / 4)
//                   : const EdgeInsets.symmetric(horizontal: 32),
//               width: double.infinity,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   const SizedBox(height: 64),
//                   Text(
//                     "Login",
//                     style: TextStyle(
//                         fontSize: 28,
//                         color: blueColor,
//                         fontWeight: FontWeight.w900),
//                   ),
//                   const SizedBox(height: 44),
//                   TextFieldInput(
//                     hintText: 'Enter your email',
//                     textInputType: TextInputType.emailAddress,
//                     textEditingController: _emailController,
//                   ),
//                   const SizedBox(
//                     height: 24,
//                   ),
//                   TextFieldInput(
//                     hintText: 'Enter your password',
//                     textInputType: TextInputType.text,
//                     textEditingController: _passwordController,
//                     isPass: true,
//                   ),
//                   const SizedBox(
//                     height: 24,
//                   ),
//                   InkWell(
//                     child: Container(
//                       child: !_isLoading
//                           ? const Text(
//                               'Log in',
//                             )
//                           : const SizedBox(
//                               width: 16,
//                               height: 16,
//                               child: CircularProgressIndicator(
//                                 color: primaryColor,
//                               ),
//                             ),
//                       width: double.infinity,
//                       alignment: Alignment.center,
//                       padding: const EdgeInsets.symmetric(vertical: 12),
//                       decoration: const ShapeDecoration(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.all(Radius.circular(4)),
//                         ),
//                         color: blueColor,
//                       ),
//                     ),
//                     onTap: loginUser,
//                   ),
//                   const SizedBox(
//                     height: 18,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                         child: const Text(
//                           "Don't have an account?",
//                         ),
//                         padding: const EdgeInsets.symmetric(vertical: 8),
//                       ),
//                       GestureDetector(
//                         onTap: () => Navigator.of(context).push(
//                           MaterialPageRoute(
//                             builder: (context) => SignupScreen(),
//                           ),
//                         ),
//                         child: Container(
//                           child: const Text(
//                             ' Signup.',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           padding: const EdgeInsets.symmetric(vertical: 8),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/log_and_signup/signup_screen.dart';
import 'package:flutter_application_1/Screens/log_and_signup/welcome_screen.dart';
import 'package:flutter_application_1/responsive/mobile_screen_layout.dart';
import '../../Widgets/my_password_field.dart';
import '../../Widgets/my_text_button.dart';
import '../../Widgets/my_text_field.dart';
import '../../resources/auth_methods.dart';
import '../../utils/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordVisible = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  showSnackBar(String content, BuildContext context) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(content)));
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);
    if (res == 'success') {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const MobileScreenLayout(),
          ),
          (route) => false);

      setState(() {
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      showSnackBar(res, context);
    }
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
        //to make page scrollable
        child: CustomScrollView(
          reverse: true,
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome back.",
                            style: kHeadline,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "You've been missed!",
                            style: kBodyText2,
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          MyTextField(
                            hintText: 'Email',
                            inputType: TextInputType.text,
                            controller: _emailController,
                          ),
                          MyPasswordField(
                            isPasswordVisible: isPasswordVisible,
                            controller: _passwordController,
                            onTap: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Dont't have an account? ",
                          style: kBodyText,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => SignupScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Register',
                            style: kBodyText.copyWith(
                              color: Colors.blue,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MyTextButton(
                      buttonName: !_isLoading
                          ? const Text('Sign In',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ))
                          : const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                color: primaryColor,
                              ),
                            ),
                      onTap: loginUser,
                      bgColor: Colors.blue,
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
