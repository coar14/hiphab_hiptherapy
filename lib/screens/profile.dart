import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy/themes/const_style.dart';
import 'package:therapy/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  final user = FirebaseAuth.instance.currentUser;
  final Logger logger = Logger();

  void signUserOut(BuildContext context) {
    logger.d("Attempting to sign out...");
    FirebaseAuth.instance.signOut().then((_) {
      logger.d("Signed out successfully");
      Navigator.pushReplacementNamed(context, '/');
    }).catchError((error) {
      logger.e("Failed to sign out: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          child: Column(
            children: [
              Text(
                'PROFILE',
                style: GoogleFonts.leagueSpartan(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: aGray,
                ),
              ),
              const SizedBox(height: 20.0),
              Center(
                child: Image.asset(
                  'assets/male.png',
                  height: 90,
                  width: 90,
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                'Seru',
                style: GoogleFonts.lato(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 1.0),
              Text(
                '@seru24hr',
                style: GoogleFonts.lato(
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(height: 16.0),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 66,
                        color: abox,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Image.asset('assets/edit.png'),
                              const SizedBox(width: 10),
                              Text(
                                'Edit Profile',
                                style: GoogleFonts.lato(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(width: 85),
                              const Icon(Icons.arrow_forward_ios_rounded)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 66,
                        color: abox,
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Image.asset('assets/privacy.png'),
                              const SizedBox(width: 10),
                              Text(
                                'Privacy Settings',
                                style: GoogleFonts.lato(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(width: 70),
                              const Icon(Icons.arrow_forward_ios_rounded)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 66,
                        color: abox,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Image.asset('assets/about.png'),
                              const SizedBox(width: 10),
                              Text(
                                'About',
                                style: GoogleFonts.lato(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(width: 160),
                              const Icon(Icons.arrow_forward_ios_rounded)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 66,
                        color: abox,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Image.asset('assets/logout.png'),
                              const SizedBox(width: 10),
                              Text(
                                'Logout',
                                style: GoogleFonts.lato(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () => signUserOut(context),
                                icon: const Icon(Icons.logout),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
