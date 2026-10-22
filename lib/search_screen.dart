import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _TeamSearchPageState();
}

class _TeamSearchPageState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();

  int selectedCategory = 0;

  final Color backgroundColor = const Color(0xFF191827);
  final Color circleColor = const Color(0xFF222131);
  final Color secondaryTextColor = const Color(0xFF777684);

  final List<Map<String, String>> matches = [
    {
      'team1': 'Barcelona',
      'team2': 'Real Madrid',
      'date': 'Monday, 12 Feb 2021 . 02.30 am',
      'logo1': 'assets/fad4a6f3e8cb80571fbec4db9175aeddcdb256fd.png',
      'logo2': 'assets/d181082721d9bc2c79d44ba5dc56d7253a1a5062.png',
    },
    {
      'team1': 'Aersenal',
      'team2': 'Aston Villa',
      'date': 'Tuesday, 9 Mar 2021 . 05.00 am',
      'logo1': 'assets/adca50778b72a1aec7f192b363754bcdf49f94e0 (1).png',
      'logo2': 'assets/3194ba9bc0d603ecf7ba28ac8428ce7119475620.png',
    },
    {
      'team1': 'Chelsea',
      'team2': 'Liverpool',
      'date': 'Saturday, 14 Mar 2021 . 01.00 am',
      'logo1': 'assets/9b4abc014fc0597717a04481403b8bf9f387d10c.png',
      'logo2': 'assets/58dbe8532a6c8aa9efb80e9502e483d55b180493.png',
    },
    {
      'team1': 'Dortmund',
      'team2': 'München',
      'date': 'Wednesday, 8 Apr 2021 . 02.30 am',
      'logo1': '',
      'logo2': 'assets/bayern.png',
    },
    {
      'team1': 'Real Madrid',
      'team2': 'Arsenal',
      'date': 'Friday, 21 Apr 2021 . 00.45 am',
      'logo1': 'assets/d181082721d9bc2c79d44ba5dc56d7253a1a5062.png',
      'logo2': 'assets/adca50778b72a1aec7f192b363754bcdf49f94e0 (1).png',
    },
    {
      'team1': 'Tottenham',
      'team2': 'Watford',
      'date': 'Friday, 21 Apr 2021 . 02.45 am',
      'logo1': 'assets/0120fd5f1e44a2fa497512bf8034e53c2c35a37b.png',
      'logo2': 'assets/watford.png',
    },
    {
      'team1': 'Swansea City',
      'team2': 'Fulham',
      'date': 'Sunday, 2 May 2021 . 04.45 am',
      'logo1': 'assets/swansea.png',
      'logo2': 'assets/idezia.png',
    },
    {
      'team1': 'Wolfsburg',
      'team2': 'Liverpool',
      'date': 'Wednesday, 15 May 2021 . 01.00 am',
      'logo1': 'assets/Wolfsburg.png',
      'logo2': 'assets/58dbe8532a6c8aa9efb80e9502e483d55b180493.png',
    },
  ];

  final List<String> categories = [
    'Live Score',
    'News',
    'Rankings',
    'Stadium',
  ];

  final List<String> categoryImages = [
    '',
    'assets/newspaper_1f4f0 2.png',
    'assets/keycap-number-sign_23-fe0f-20e3 3.png',
    'assets/stadium_1f3df-fe0f 2.png',
  ];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredMatches = matches.where((match) {
      final query = searchController.text.toLowerCase();

      return match['team1']!.toLowerCase().contains(query) ||
          match['team2']!.toLowerCase().contains(query);
    }).toList();

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 25),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: circleColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        controller: searchController,
                        onChanged: (_) => setState(() {}),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                        ),
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search your team ...',
                          hintStyle: TextStyle(
                            color: secondaryTextColor,
                            fontSize: 22,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            size: 42,
                            color: secondaryTextColor,
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      searchController.clear();
                      FocusScope.of(context).unfocus();
                      setState(() {});
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 17),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final isSelected = selectedCategory == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 27),
                      padding: EdgeInsets.symmetric(
                        horizontal: index == 0 ? 30 : 0,
                      ),
                      width: index == 0 ? 225 : 70,
                      decoration: BoxDecoration(
                        color: circleColor,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (index == 0)
                            const Text(
                              '🔥',
                              style: TextStyle(fontSize: 22),
                            )
                          else
                            Image.asset(
                              categoryImages[index],
                              width: 20,
                              height: 20,
                              fit: BoxFit.contain,
                            ),
                          if (index == 0) ...[
                            const SizedBox(width: 20),
                            const Flexible(
                              child: Text(
                                'Live Score',
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
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
            ),

            const SizedBox(height: 15),

            // Match list
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                itemCount: filteredMatches.length,
                itemBuilder: (context, index) {
                  final match = filteredMatches[index];

                  return Container(
                    height: 100,
                    margin: const EdgeInsets.only(bottom: 0),
                    child: Row(
                      children: [
                        // Two circular team logos
                        Row(
                          children: [
                            _teamLogo(match['logo1']!),
                            const SizedBox(width: 7),
                            _teamLogo(match['logo2']!),
                          ],
                        ),

                        const SizedBox(width: 30),

                        // Match title and date
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${match['team1']} VS ${match['team2']}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                match['date']!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: secondaryTextColor,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 12),

                        // Remove button
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              matches.remove(match);
                            });
                          },
                          child: Icon(
                            Icons.close,
                            color: secondaryTextColor,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _teamLogo(String assetPath) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: circleColor,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Image.asset(
          assetPath,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(
              Icons.shield,
              color: Colors.white54,
              size: 25,
            );
          },
        ),
      ),
    );
  }
}