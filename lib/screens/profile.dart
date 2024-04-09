import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:therapy/themes/const_style.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40.0),
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
              SizedBox(height: 20.0),
              Center(
                child: Image.asset(
                  'assets/male.png',
                  height: 90,
                  width: 90,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Seru',
                style: GoogleFonts.lato(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 1.0),
              Text(
                '@seru24hr',
                style: GoogleFonts.lato(
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 16.0),
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
                              SizedBox(width: 10),
                              Text(
                                'Edit Profile',
                                style: GoogleFonts.lato(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(width: 85),
                              Icon(Icons.arrow_forward_ios_rounded)
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
                              SizedBox(width: 10),
                              Text(
                                'Privacy Settings',
                                style: GoogleFonts.lato(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(width: 70),
                              Icon(Icons.arrow_forward_ios_rounded)
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
                              SizedBox(width: 10),
                              Text(
                                'About',
                                style: GoogleFonts.lato(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(width: 170),
                              Icon(Icons.arrow_forward_ios_rounded)
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
                              SizedBox(width: 10),
                              Text(
                                'Logout',
                                style: GoogleFonts.lato(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(width: 140),
                              Icon(Icons.arrow_forward_ios_rounded)
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
