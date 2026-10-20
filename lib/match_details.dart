
import 'package:flutter/material.dart';

class MatchDetailsPage extends StatefulWidget {
  const MatchDetailsPage({super.key});

  @override
  State<MatchDetailsPage> createState() => _MatchDetailsPageState();
}

class _MatchDetailsPageState extends State<MatchDetailsPage> {
  int selectedTab = 0;

  final Color backgroundColor = const Color(0xFF191827);
  final Color cardColor = const Color(0xFF29283B);
  final Color orangeColor = const Color(0xFFFF8B70);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: selectedTab,
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),

                      // App bar
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: const Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            const Expanded(
                              child: Text(
                                'UEFA Champions League',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(width: 48),
                          ],
                        ),
                      ),

                      const SizedBox(height: 25),

                      // Teams and score
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
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
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      '2 - 3',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 57,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8),
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

                      const SizedBox(height: 25),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                            color: cardColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TabBar(
                            onTap: (index) {
                              setState(() {
                                selectedTab = index;
                              });
                            },
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicatorPadding: const EdgeInsets.all(4),
                            indicator: BoxDecoration(
                              color: orangeColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            dividerColor: Colors.transparent,
                            labelColor: Colors.white,
                            unselectedLabelColor: Colors.white70,
                            labelStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            unselectedLabelStyle: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            tabs: const [
                              Tab(text: 'Match Details'),
                              Tab(text: 'Line Up'),
                              Tab(text: 'H2H'),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Tab content
                      SizedBox(
                        height: 330,
                        width: double.infinity,
                        child: TabBarView(
                          children: [
                            // Match Details
                            SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Column(
                                children: [
                                  _statRow('8', 'Shooting', '12'),
                                  _statRow('22', 'Attacks', '29'),
                                  _statRow('42%', 'Possession', '58%'),
                                  _statRow('3', '🟨 yellow Cards', '5'),
                                  _statRow('8', 'Corners', '7'),
                                ],
                              ),
                            ),

                            const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 20),
                                  Text(
                                    'Formation (4-2-3-1)',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Image(
                                    image: AssetImage('assets/Group 3232.png'),
                                    width: double.infinity,
                                    height: 700,
                                    fit: BoxFit.contain,
                                  ),
                                ],
                              ),
                            ),
                            // Head to Head
                            const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.compare_arrows,
                                    color: Colors.white70,
                                    size: 45,
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                    'Head to Head',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 60),

                      // Other matches heading
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'Other Match',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'See all',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Match card 1
                      _matchCard(
                        'assets/60db32edf242a46614df9825164eedce95932cf8.png',
                        'assets/9b4abc014fc0597717a04481403b8bf9f387d10c.png',
                        'Man United vs Chelsea FC',
                        '2',
                        '3',
                      ),

                      const SizedBox(height: 16),

                      // Match card 2
                      _matchCard(
                        'assets/0120fd5f1e44a2fa497512bf8034e53c2c35a37b.png',
                        'assets/d28a08bfc9623c2a1c0dcafeb3c00796379925af.png',
                        'Tottenham vs Southampton',
                        '1',
                        '0',
                      ),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Team logo and name
  Widget _team(String image, String name) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 76,
          height: 76,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF222130),
            border: Border.all(
              color: const Color(0xFF302E40),
              width: 3,
            ),
          ),
          padding: const EdgeInsets.all(18),
          child: Image.asset(
            image,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(
                Icons.shield_outlined,
                color: Colors.white54,
                size: 40,
              );
            },
          ),
        ),
        const SizedBox(height: 18),
        SizedBox(
          width: double.infinity,
          child: Text(
            name,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  // Match statistics row
  Widget _statRow(String left, String title, String right) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24, vertical: 13,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              left,
              textAlign: TextAlign.start,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 19,
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
                fontSize: 17,
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
                fontSize: 19,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Other match card
  Widget _matchCard(
    String team1,
    String team2,
    String title,
    String score1,
    String score2,
  ) {
    return Container(
      height: 78,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),

          _smallLogo(team1),

          const SizedBox(width: 6),

          _smallLogo(team2),

          const SizedBox(width: 8),

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
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      score1,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      '-',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      score2,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 6),

          Container(
            width: 48,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF242335),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(22),
                bottomRight: Radius.circular(22),
              ),
            ),
            alignment: Alignment.center,
            child: const Text(
              'FT',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Small team logo
  Widget _smallLogo(String asset) {
    return Container(
      width: 43,
      height: 43,
      decoration: const BoxDecoration(
        color: Color(0xFF222130),
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(8),
      child: Image.asset(
        asset,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return const Icon(
            Icons.shield_outlined,
            color: Colors.white54,
            size: 25,
          );
        },
      ),
    );
  }
}
