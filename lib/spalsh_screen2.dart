
import 'package:flutter/material.dart';

class SpalshScreen2 extends StatefulWidget {
  const SpalshScreen2({super.key});

  @override
  State<SpalshScreen2> createState() => _SpalshScreen2State();
}

class _SpalshScreen2State extends State<SpalshScreen2> {
  final List<String> sports = [
    'Soccer',
    'Basketball',
    'Football',
    'Baseball',
    'Tennis',
    'Volleyball',
  ];

  final List<String> images = [
    'assets/28f97507dc89be2b1e345eb5138441e66cf6066a.png',
    'assets/f7c3ef587e2082182e4b58d6247a1cada6e84438.png',
    'assets/02e33698338c0be7cdbb3fddb5a6f10337e370ee.png',
    'assets/aa7a3336e56ea210818ca393f74fddb2f7afac47.png',
    'assets/50679ac877f64bc85640cbab0d337fbe37d2ad33.png',
    'assets/53f3a4017563ce958f3583e3135da373ff89e256.png',
  ];

  final Set<int> selectedSports = {0};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF191827),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),

              const Text(
                'What sport do\nyou interest?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 39,
                  fontWeight: FontWeight.w700,
                  height: 1.22,
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                'You can choose more than one',
                style: TextStyle(
                  color: Color(0xFF62616F),
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 30),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: sports.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.68,
                ),
                itemBuilder: (context, index) {
                  final bool isSelected =
                      selectedSports.contains(index);

                  return LayoutBuilder(
                    builder: (context, constraints) {
                      final double circleSize =
                          constraints.maxWidth < 90
                              ? constraints.maxWidth
                              : 90.0;

                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          setState(() {
                            if (isSelected) {
                              selectedSports.remove(index);
                            } else {
                              selectedSports.add(index);
                            }
                          });
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AnimatedContainer(
                              duration:
                                  const Duration(milliseconds: 200),
                              width: circleSize,
                              height: circleSize,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isSelected
                                    ? const Color(0xFFFF896F)
                                    : const Color(0xFF222132),
                              ),
                              child: Center(
                                child: Image.asset(
                                  images[index],
                                  width: circleSize * 0.58,
                                  height: circleSize * 0.58,
                                  fit: BoxFit.contain,
                                  errorBuilder:
                                      (context, error, stackTrace) {
                                    return Icon(
                                      Icons.sports,
                                      color: Colors.white,
                                      size: circleSize * 0.45,
                                    );
                                  },
                                ),
                              ),
                            ),

                            const SizedBox(height: 25),

                            Text(
                              sports[index],
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 64,
                child: ElevatedButton(
                  onPressed: () {
                    final List<String> selectedNames =
                        selectedSports
                            .map((index) => sports[index])
                            .toList();

                    debugPrint(
                      'Selected sports: $selectedNames',
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2868F5),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Center(
                child: TextButton(
                  onPressed: () {
                    debugPrint('Skipped sports selection');
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}