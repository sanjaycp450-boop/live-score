import 'package:flutter/material.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: const Color(0xFF191827),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: SizedBox(
                height: constraints.maxHeight,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 36,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 110),

                      SizedBox(
                        height: 500,
                        width: double.infinity,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              top: 75,
                              left: 15,
                              right: 20,
                              height: 428,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFF222131),
                                  borderRadius:
                                      BorderRadius.circular(105),
                                ),
                              ),
                            ),

                            Positioned(
                              top: 0,
                              left: 20,
                              right: 10,
                              bottom: 0,
                              child: Image.asset(
                                'assets/97db4e4b8c77cee8eeffe64dd6dad785947aa029.png',
                                fit: BoxFit.contain,
                                alignment: Alignment.bottomCenter,
                              ),
                            ),

                            const Positioned(
                              top: 35,
                              left: 25,
                              child: CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.white,
                              ),
                            ),

                            const Positioned(
                              right: 5,
                              bottom: 140,
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor:
                                    Color(0xFF2868FF),
                              ),
                            ),


                            const Positioned(
                              left: 26,
                              bottom: 32,
                              child: CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const Spacer(),

                      const Text(
                        'Dicover all\nabout sport',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 44,
                          fontWeight: FontWeight.w600,
                          height: 1.08,
                        ),
                      ),

                      const SizedBox(height: 36),

                      const Text(
                        'Search millions of jobs and get the\n'
                        'inside scoop on companies.\n'
                        'Wait for what? Let’s get start it!',
                        style: TextStyle(
                          color: Color(0xFF777583),
                          fontSize: 18,
                          height: 1.4,
                        ),
                      ),

                      const Spacer(),

                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: SizedBox(
                              height: 76,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen())
                                  );
    
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color(0xFF2868FF),
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(28),
                                  ),
                                ),
                                child: const Text(
                                  'Sign in',
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 28),

                          Expanded(
                            flex: 2,
                            child: TextButton(
                              onPressed: () {

                              },
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Color(0xFFD0CFD8),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}