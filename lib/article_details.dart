
import 'package:flutter/material.dart';

class ArticleDetailsPage extends StatelessWidget {
  const ArticleDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const Color bgColor = Color(0xFF191827);
    const Color orangeColor = Color(0xFFFF856F);
    const Color mutedColor = Color(0xFFB8B8C5);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Main article image
              SizedBox(
                height: 345,
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        child: Image.asset(
                          'assets/image/article4.png',
                          width: double.infinity,
                          height: 345,
                          fit: BoxFit.contain,
                       
                        ),
                      ),
                    ),

                    Positioned(
                      top: 25,
                      left: 20,
                      child: _circleButton(
                        icon: Icons.arrow_back_ios_new,
                        color: Colors.black26,
                        onTap: () => Navigator.pop(context),
                      ),
                    ),

                    Positioned(
                      top: 25,
                      right: 28,
                      child: _circleButton(
                        icon: Icons.share_outlined,
                        color: Colors.white24,
                        onTap: () {},
                      ),
                    ),

                    Positioned(
                      top: 97,
                      right: 28,
                      child: _circleButton(
                        icon: Icons.bookmark_border,
                        color: orangeColor,
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 27),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 28),
                child: Text(
                  'Arsenal vs Aston Villa\nprediction',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    height: 1.35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 29),
                child: Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/image 131.png',
                        width: 36,
                        height: 36,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const CircleAvatar(
                            radius: 18,
                            backgroundColor: Color(0xFF29283B),
                            child: Icon(
                              Icons.person,
                              color: Colors.white70,
                              size: 22,
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(width: 12),

                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Brian Imanuel',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'May 15, 2020',
                            style: TextStyle(
                              color: mutedColor,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                      size: 17,
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      '1403',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                      ),
                    ),

                    const SizedBox(width: 12),

                    const Icon(
                      Icons.chat_bubble_outline,
                      color: Colors.white,
                      size: 16,
                    ),
                    const SizedBox(width: 5),
                    const Text(
                      '976',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 29),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      height: 1.9,
                    ),
                    children: [
                      TextSpan(
                        text: 'A',
                        style: TextStyle(
                          fontSize: 48,
                          height: 0.95,
                        ),
                      ),
                      TextSpan(
                        text:
                            'rsenal will have to grind it out against '
                            'Aston Villa if they are to register '
                            'League wins. The match is scheduled for '
                            'Sunday at the Emirates.',
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 15),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 29),
                child: Text(
                  'The Gunners put forth a real statement of intent '
                  'after their 1-0 win against Manchester United.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    height: 1.9,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 29),
                child: Text(
                  'Mikel Arteta and his team will be looking to '
                  'continue their strong performance.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                    height: 1.9,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 29),
                child: Text(
                  'Both teams will be aiming to secure a positive '
                  'result. Arsenal will need to maintain their '
                  'defensive discipline and create chances in attack.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                    height: 1.9,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerFloat,

      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 34),
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: () {
              // Add Read More functionality here.
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: orangeColor,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Read More',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 12),
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget _circleButton({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      color: color,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          width: 48,
          height: 48,
          child: Icon(
            icon,
            color: Colors.white,
            size: 22,
          ),
        ),
      ),
    );
  }
}