import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy/components/my_button.dart';
import 'package:therapy/components/my_textfield.dart';
import 'package:therapy/themes/const_style.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class Login extends StatefulWidget {
  const Login({super.key}); // Make constructor const

  @override
  LoginState createState() => LoginState(); // Make state class public
}

class LoginState extends State<Login> {
  final Color lightGrey = const Color(0xFFE8E8E8);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _scrollController = ScrollController();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  void signUserIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
  }

  @override
  void initState() {
    super.initState();
    // Adding listeners to the focus nodes to handle scroll
    emailFocusNode.addListener(() {
      if (emailFocusNode.hasFocus) {
        _scrollToFocusedField(emailFocusNode);
      }
    });
    passwordFocusNode.addListener(() {
      if (passwordFocusNode.hasFocus) {
        _scrollToFocusedField(passwordFocusNode);
      }
    });
  }

  void _scrollToFocusedField(FocusNode focusNode) {
    Future.delayed(const Duration(milliseconds: 300), () {
      final context = focusNode.context;
      if (context != null) {
        Scrollable.ensureVisible(
          context,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    emailController.dispose();
    passwordController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: KeyboardVisibilityBuilder(
          builder: (context, isKeyboardVisible) {
            return LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  controller: _scrollController,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: isKeyboardVisible
                            ? MediaQuery.of(context).viewInsets.bottom
                            : 0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 0),

                          // logo
                          Image.asset(
                            'assets/logologin.png',
                            width: 380,
                            height: 350,
                          ),

                          // welcome back
                          Text(
                            'Welcome back, you\'ve been missed.',
                            style: GoogleFonts.lato(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: aGray,
                            ),
                          ),

                          const SizedBox(height: 25),

                          // username
                          MyTextField(
                            controller: emailController,
                            hintText: 'Email',
                            obscureText: false,
                            focusNode: emailFocusNode,
                          ),

                          const SizedBox(height: 22),

                          // password
                          MyTextField(
                            controller: passwordController,
                            hintText: 'Password',
                            obscureText: true,
                            focusNode: passwordFocusNode,
                          ),

                          // forgot password
                          const SizedBox(height: 10),

                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Forgot Password?',
                                  style: GoogleFonts.lato(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: aGray,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // sign in button
                          const SizedBox(height: 20),

                          MyButton(
                            onTap: signUserIn,
                          ),

                          const SizedBox(height: 15),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Not a member yet?',
                                style: GoogleFonts.lato(
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Register now',
                                style: GoogleFonts.lato(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
