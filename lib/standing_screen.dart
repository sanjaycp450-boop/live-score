import 'package:flutter/material.dart';

import 'standingdetails.dart';

class StandingsPage extends StatefulWidget {
  const StandingsPage({super.key});

  @override
  State<StandingsPage> createState() => _StandingsPageState();
}

class _StandingsPageState extends State<StandingsPage> {
  int selectedSport = 0;
  int selectedBottom = 2;

  final Color bgColor = const Color(0xFF191827);
  final Color cardColor = const Color(0xFF242333);
  final Color mutedColor = const Color(0xFF858493);
  final Color orangeColor = const Color(0xFFFF806B);

  final List<Map<String, dynamic>> sports = [
    {'name': 'Soccer', 'icon': '⚽'},
    {'name': 'Basketball', 'icon': '🏀'},
    {'name': 'Football', 'icon': '🏈'},
    {'name': 'Baseball', 'icon': '⚾'},
    {'name': 'Tennis', 'icon': '🎾'},
  ];

  final List<Map<String, dynamic>> leagues = [
    {
      'name': 'La Liga',
      'country': 'Spain',
      'flag': 'assets/image 10.png',
      'teams': [
        {
          'logo': 'assets/Atletico.png',
          'name': 'Atlético Madrid',
          'd': '2',
          'l': '1',
          'ga': '6',
          'gd': '23',
          'pts': '38',
        },
        {
          'logo': 'assets/d181082721d9bc2c79d44ba5dc56d7253a1a5062.png',
          'name': 'Real Madrid',
          'd': '4',
          'l': '3',
          'ga': '7',
          'gd': '15',
          'pts': '37',
        },
        {
          'logo': 'assets/fad4a6f3e8cb80571fbec4db9175aeddcdb256fd.png',
          'name': 'Barcelona',
          'd': '4',
          'l': '4',
          'ga': '9',
          'gd': '20',
          'pts': '34',
        },
        {
          'logo': 'assets/Villareal.png',
          'name': 'Villarreal',
          'd': '8',
          'l': '2',
          'ga': '10',
          'gd': '16',
          'pts': '32',
        },
      ],
    },
    {
      'name': 'Premier League',
      'country': 'England',
      'flag': 'assets/image 9.png',
      'teams': [
        {
          'logo': 'assets/58dbe8532a6c8aa9efb80e9502e483d55b180493.png',
          'name': 'Liverpool',
          'd': '6',
          'l': '2',
          'ga': '21',
          'gd': '16',
          'pts': '33',
        },
        {
          'logo': 'assets/idezia.png',
          'name': 'Man United',
          'd': '3',
          'l': '3',
          'ga': '24',
          'gd': '9',
          'pts': '33',
        },
        {
          'logo': 'assets/luster.png',
          'name': 'Leicester City',
          'd': '2',
          'l': '5',
          'ga': '21',
          'gd': '10',
          'pts': '32',
        },
      ],
    },
  ];

  Widget assetImage(String path, {double width = 25, double height = 25}) {
    return Image.asset(
      path,
      width: width,
      height: height,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return Icon(
          Icons.shield_outlined,
          size: width < height ? width : height,
          color: mutedColor,
        );
      },
    );
  }

  Widget buildSportSelector() {
    return SizedBox(
      height: 48,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: sports.length,
        itemBuilder: (context, index) {
          final bool selected = selectedSport == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedSport = index;
              });
            },
            child: Container(
              margin: EdgeInsets.only(
                right: index == sports.length - 1 ? 0 : 16,
              ),
              width: selected ? 166 : 66,
              decoration: BoxDecoration(
                color: selected ? orangeColor : cardColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    sports[index]['icon'] as String,
                    style: const TextStyle(fontSize: 34),
                  ),
                  if (selected) ...[
                    const SizedBox(width: 10),
                    Flexible(
                      child: Text(
                        sports[index]['name'] as String,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildLeagueHeader(Map<String, dynamic> league) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Row(
        children: [
          assetImage(league['flag'] as String, width: 43, height: 34),
          const SizedBox(width: 23),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  league['name'] as String,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  league['country'] as String,
                  style: TextStyle(color: mutedColor, fontSize: 18),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LaLigaPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(8),
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(12),
              // ),
              elevation: 4,
            ),
            child: const Icon(
              Icons.chevron_right,
              color: Colors.white,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTable(Map<String, dynamic> league) {
    final List<dynamic> teams = league['teams'] as List<dynamic>;

    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.fromLTRB(16, 25, 4, 18),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                flex: 5,
                child: Text(
                  'Team',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              ...['D', 'L', 'Ga', 'Gd', 'Pts'].map(
                (title) => SizedBox(
                  width: 40,
                  child: Center(
                    child: Text(
                      title,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 1),
          ...teams.map((team) {
            return Row(
              children: [
                Expanded(
                  flex: 5,
                  child: SizedBox(
                    height: 71,
                    child: Row(
                      children: [
                        assetImage(
                          team['logo'] as String,
                          width: 28,
                          height: 28,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            team['name'] as String,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ...['d', 'l', 'ga', 'gd', 'pts'].map(
                  (key) => Container(
                    width: 40,
                    height: 71,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.black.withOpacity(0.18)),
                        bottom: BorderSide(
                          color: Colors.black.withOpacity(0.18),
                        ),
                      ),
                    ),
                    child: Text(
                      team[key] as String,
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }

  Widget buildLeague(Map<String, dynamic> league) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [buildLeagueHeader(league), buildTable(league)],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 15,
                  bottom: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 58,
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      decoration: BoxDecoration(
                        color: cardColor,
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.search,
                            color: Color(0xFF686775),
                            size: 32,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextField(
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'Search your competition ...',
                                hintStyle: const TextStyle(
                                  color: Color(0xFF858493),
                                  fontSize: 16,
                                ),
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 35),
                    buildSportSelector(),
                    const SizedBox(height: 40),
                    ...leagues.map(
                      (league) => Padding(
                        padding: const EdgeInsets.only(bottom: 35),
                        child: buildLeague(league),
                      ),
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
