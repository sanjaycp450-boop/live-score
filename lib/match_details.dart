import 'package:flutter/material.dart';

class MatchDetailsPage extends StatefulWidget {
  const MatchDetailsPage({super.key});

  @override
  State<MatchDetailsPage> createState() => _MatchDetailsPageState();
}

class _MatchDetailsPageState extends State<MatchDetailsPage> {
  int selectedTab = 0;
  int selectedBottom = 0;

  final Color backgroundColor = const Color(0xFF191827);
  final Color cardColor = const Color(0xFF29283B);
  final Color orangeColor = const Color(0xFFFF8B70);
  final Color blueColor = const Color(0xFF3478F6);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 25),

                    // App bar
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                          const Expanded(
                            child: Text(
                              'UEFA Champions League',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(width: 48),
                        ],
                      ),
                    ),

                    const SizedBox(height: 55),

                    // Teams and score
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        children: [
                          Expanded(
                            child: _team(
                              'assets/adca50778b72a1aec7f192b363754bcdf49f94e0.png',
                              'Arsenal',
                            ),
                          ),

                          const Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Text(
                                  '2 - 3',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 57,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  '90.15',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Expanded(
                            child: _team(
                              'assets/3194ba9bc0d603ecf7ba28ac8428ce7119475620.png',
                              'Aston Villa',
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 72),

                    // Match tabs
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          _tabButton('Match Detail', 0, 1.35),
                          _tabButton('Line Up', 1, 1),
                          _tabButton('H2H', 2, 0.75),
                        ],
                      ),
                    ),

                    const SizedBox(height: 36),

                    // Match statistics
                    if (selectedTab == 0) ...[
                      _statRow('8', 'Shooting', '12'),
                      _statRow('22', 'Attacks', '29'),
                      _statRow('42', 'Possession', '58'),
                      _statRow('3', '🟨 Cards', '5'),
                      _statRow('8', 'Corners', '7'),
                    ] else if (selectedTab == 1) ...[
                      const Padding(
                        padding: EdgeInsets.all(24),
                        child: Text(
                          'Line Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ] else ...[
                      const Padding(
                        padding: EdgeInsets.all(24),
                        child: Text(
                          'Head to Head',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ],

                    const SizedBox(height: 45),

                    // Other matches heading
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Other Match',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 27,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'See all',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    _matchCard(
                      'assets/60db32edf242a46614df9825164eedce95932cf8.png',
                      'assets/9b4abc014fc0597717a04481403b8bf9f387d10c.png',
                      'Man United vs Chelsea FC',
                      '2',
                      '3',
                    ),

                    const SizedBox(height: 38),

                    _matchCard(
                      'assets/0120fd5f1e44a2fa497512bf8034e53c2c35a37b.png',
                      'assets/d28a08bfc9623c2a1c0dcafeb3c00796379925af.png',
                      'Tottenham vs Southampton',
                      '1',
                      '0',
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),

            // Bottom navigation bar
           
          ],
        ),
      ),
    );
  }

  Widget _team(String image, String name) {
    return Column(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF222130),
            border: Border.all(
              color: const Color(0xFF302E40),
              width: 3,
            ),
          ),
          padding: const EdgeInsets.all(22),
          child: Image.asset(
            image,
            fit: BoxFit.contain,
            errorBuilder: (_, __, ___) => const Icon(
              Icons.shield_outlined,
              color: Colors.white54,
              size: 48,
            ),
          ),
        ),
        const SizedBox(height: 30),
        Text(
          name,
          textAlign: TextAlign.center,
          maxLines: 1,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _tabButton(String title, int index, double flex) {
    final bool selected = selectedTab == index;

    return Expanded(
      flex: (flex * 100).round(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: GestureDetector(
          onTap: () {
            setState(() {
              selectedTab = index;
            });
          },
          child: Container(
            height: 88,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: selected ? orangeColor : Colors.transparent,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 19,
                fontWeight:
                    selected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _statRow(String left, String title, String right) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 48,
        vertical: 17,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              left,
              textAlign: TextAlign.start,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 31,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFFBDBCC8),
                fontSize: 29,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              right,
              textAlign: TextAlign.end,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 31,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _matchCard(
    String team1,
    String team2,
    String title,
    String score1,
    String score2,
  ) {
    return Container(
      height: 130,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          const SizedBox(width: 15),

          _smallLogo(team1),
          const SizedBox(width: 8),
          _smallLogo(team2),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      score1,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(width: 30),
                    const Text(
                      '-',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(width: 30),
                    Text(
                      score2,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Container(
            width: 75,
            height: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFF242335),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            alignment: Alignment.center,
            child: const Text(
              'FT',
              style: TextStyle(
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _smallLogo(String asset) {
    return Container(
      width: 60,
      height: 60,
      decoration: const BoxDecoration(
        color: Color(0xFF222130),
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(10),
      child: Image.asset(
        asset,
        fit: BoxFit.contain,
        errorBuilder: (_, __, ___) => const Icon(
          Icons.shield_outlined,
          color: Colors.white54,
        ),
      ),
    );
  }

//   // Widget _bottomItem(IconData icon, String label, int index) {
//   //   final bool selected = selectedBottom == index;

//   //   return Expanded(
//   //     child: InkWell(
//   //       onTap: () {
//   //         setState(() {
//   //           selectedBottom = index;
//   //         });
//   //       },
//   //       child: Column(
//   //         mainAxisAlignment: MainAxisAlignment.center,
//   //         children: [
//   //           Icon(
//   //             icon,
//   //             size: 39,
//   //             color: selected ? blueColor : Colors.white30,
//   //           ),
//   //           if (label.isNotEmpty) ...[
//   //             const SizedBox(height: 5),
//   //             Text(
//   //               label,
//   //               style: TextStyle(
//   //                 color: selected ? blueColor : Colors.white30,
//   //                 fontSize: 17,
//   //                 fontWeight: FontWeight.w600,
//   //               ),
//   //             ),
//   //             const SizedBox(height: 4),
//   //             if (selected)
//   //               Container(
//   //                 width: 8,
//   //                 height: 8,
//   //                 decoration: BoxDecoration(
//   //                   color: blueColor,
//   //                   shape: BoxShape.circle,
//   //                 ),
//   //               ),
//   //           ],
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   }
}