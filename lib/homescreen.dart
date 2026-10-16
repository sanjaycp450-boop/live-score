
import 'package:flutter/material.dart';

import 'match_details.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<Homescreen> {
  int selectedSport = 0;
  int selectedBottomIndex = 0;

  final Color backgroundColor = const Color(0xFF191827);
  final Color cardColor = const Color(0xFF252435);
  final Color selectedColor = const Color(0xFFFF927D);
  final Color blueColor = const Color(0xFF2865F5);

  Widget assetImage(
    String path, {
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
  }) {
    return Image.asset(
      path,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        return const Icon(
          Icons.image_outlined,
          color: Colors.white38,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 28, 28, 24),
                child: Row(
                  children: [
                    const Text(
                      'LiveScore',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications_none,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            width: 19,
                            height: 19,
                            decoration: const BoxDecoration(
                              color: Color(0xFFFF927D),
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              '3',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Featured banner
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Container(
                  height: 220,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF286BFF),
                        Color.fromARGB(255, 2, 15, 71),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Stack(
                    children: [
                      Positioned(
                        right: -10,
                        bottom: 0,
                        top: 0,
                        width: 275,
                        child: assetImage(
                          'assets/aa46a123e3b9ddfc383b8af5530b1b8441d711d6.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(22),
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 7,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(30),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('⚽'),
                                  SizedBox(width: 6),
                                  Text(
                                    'Football',
                                    style: TextStyle(
                                      color: Color(0xFF20202A),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            const SizedBox(
                              width: 260,
                              child: Text(
                                'Liverpool UEFA\nChampion League\nCelebration',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  height: 1.35,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const Spacer(),
                            const Text(
                              'Yesterday, 06.30 PM',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Sports category cards
              SizedBox(
                height: 164,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  children: [
                    _sportCard(
                      title: 'Soccer',
                      image: 'assets/28f97507dc89be2b1e345eb5138441e66cf6066a.png',
                      index: 0,
                    ),
                    _sportCard(
                      title: 'Basketball',
                      image: 'assets/f7c3ef587e2082182e4b58d6247a1cada6e84438.png',
                      index: 1,
                    ),
                    _sportCard(
                      title: 'Football',
                      image: 'assets/02e33698338c0be7cdbb3fddb5a6f10337e370ee.png',
                      index: 2,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              _leagueHeader(
                flag: '🇪🇸',
                league: 'La Liga',
                country: 'Spain',
              ),

              const SizedBox(height: 16),

              _matchCard(
                team1: 'assets/fad4a6f3e8cb80571fbec4db9175aeddcdb256fd.png',
                team2: 'assets/d181082721d9bc2c79d44ba5dc56d7253a1a5062.png',
                name: 'Barcelona  vs Real Madrid',
                score1: '0',
                score2: '2',
                status: 'HT',
              ),

              const SizedBox(height: 38),

              _leagueHeader(
                flag: 'en',
                league: 'Premier League',
                country: 'England',
              ),

              const SizedBox(height: 16),

              _matchCard(
                team1: 'assets/3194ba9bc0d603ecf7ba28ac8428ce7119475620.png',
                team2: 'assets/58dbe8532a6c8aa9efb80e9502e483d55b180493.png',
                name: 'Aston Villa  vs Liverpool',
                score1: '2',
                score2: '3',
                status: 'FT',
              ),

              // const SizedBox(height: 28),

              // // Additional match
              // _matchCard(
              //   team1: 'assets/images/team1.png',
              //   team2: 'assets/images/team2.png',
              //   name: 'Match highlights',
              //   score1: '1',
              //   score2: '1',
              //   status: 'FT',
              // ),
            ],
          ),
        ),
      ),
     
    );
  }

  Widget _sportCard({
    required String title,
    required String image,
    required int index,
  }) {
    final bool selected = selectedSport == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSport = index;
        });
      },
      child: Container(
        width: 160,
        margin: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: selected ? selectedColor : cardColor,
          borderRadius: BorderRadius.circular(27),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            assetImage(image, width: 66, height: 66),
            const SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 19,
                fontWeight:
                    selected ? FontWeight.w500 : FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _leagueHeader({
    required String flag,
    required String league,
    required String country,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Row(
        children: [
          Text(
            flag,
            style: const TextStyle(fontSize: 29),
          ),
          const SizedBox(width: 22),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  league,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  country,
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        IconButton(
  onPressed: () {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>MatchDetailsPage()),);
  },
  icon: const Icon(
    Icons.chevron_right,
    color: Colors.white,
    size: 30,
  ),
 
),
        ],
      ),
      
    );
  }

  Widget _matchCard({
    required String team1,
    required String team2,
    required String name,
    required String score1,
    required String score2,
    required String status,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Container(
        height: 104,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(25),
        ),
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            const SizedBox(width: 15),

            // Team logos
            Container(
              width: 52,
              height: 64,
              decoration: BoxDecoration(
                color: const Color(0xFF201F30),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(8),
              child: assetImage(team1),
            ),
            const SizedBox(width: 7),
            Container(
              width: 52,
              height: 64,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(24, 13, 13, 1),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(8),
              child: assetImage(team2),
            ),

            const SizedBox(width: 14),

            // Match title and score
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
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
                          fontSize: 19,
                        ),
                      ),
                      const SizedBox(width: 30),
                      const Text(
                        '-',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(width: 30),
                      Text(
                        score2,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Match status
            Container(
              width: 65,
              height: double.infinity,
              color: const Color(0xFF2B2A3B),
              alignment: Alignment.center,
              child: Text(
                status,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final bool selected = selectedBottomIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedBottomIndex = index;
        });
      },
      child: SizedBox(
        width: 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 32,
              color: selected
                  ? blueColor
                  : const Color(0xFF686777),
            ),
            if (label.isNotEmpty) ...[
              const SizedBox(height: 5),
              Text(
                label,
                style: TextStyle(
                  color: selected ? blueColor : Colors.white54,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              if (selected)
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: blueColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
            ],
          ],
        ),
      ),
    );
  }
}