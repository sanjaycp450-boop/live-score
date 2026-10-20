import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  int selectedSport = 0;
  int selectedBottom = 1;

  final Color bgColor = const Color(0xFF191827);
  final Color cardColor = const Color(0xFF232232);
  final Color mutedColor = const Color(0xFF777784);
  final Color orangeColor = const Color(0xFFF47F68);

  final List<Map<String, String>> sports = [
    {'icon': '⚽', 'name': 'Soccer'},
    {'icon': '🏀', 'name': ''},
    {'icon': '🏈', 'name': ''},
    {'icon': '⚾', 'name': ''},
    {'icon': '🎾', 'name': ''},
  ];

  final List<Map<String, String>> news = [
    {
      'image': 'assets/news1.jpg',
      'title': 'Roumor Has It: Lampard’s position under threat, ...',
      'date': '04 JAN 2021, 14:16',
    },
    {
      'image': 'assets/news2.jpg',
      'title': 'Arteta sees ‘natural leader’ Tierney as a future, ...',
      'date': '04 JAN 2021, 05:30',
    },
    {
      'image': 'assets/news3.jpg',
      'title': 'Athletic Bilbao to appoint Marcelino as coach until, ...',
      'date': '04 JAN 2021, 09:23',
    },
    {
      'image': 'assets/news4.jpg',
      'title': 'Barcelona suffer too much late in games, says Ter Stegen',
      'date': '04 JAN 2021, 06:06',
    },
  ];

  final List<String> trendingImages = [
    'assets/trending1.jpg',
    'assets/trending2.jpg',
  ];

  final List<String> trendingTitles = [
    'Arsenal suffer defeat in a thrilling match',
    'Liverpool celebrate another big moment',
  ];

  final Set<int> bookmarkedNews = {};

  Widget buildSportTab(int index) {
    final bool selected = selectedSport == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSport = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 88,
        padding: EdgeInsets.symmetric(
          horizontal: index == 0 ? 20 : 0,
        ),
        width: index == 0 ? 187 : 88,
        margin: const EdgeInsets.only(right: 18),
        decoration: BoxDecoration(
          color: selected ? orangeColor : cardColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              sports[index]['icon']!,
              style: const TextStyle(fontSize: 37),
            ),
            if (index == 0) ...[
              const SizedBox(width: 14),
              const Text(
                'Soccer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget buildNewsItem(int index) {
    final item = news[index];

    return Padding(
      padding: const EdgeInsets.only(bottom: 45),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              item['image']!,
              width: 122,
              height: 122,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 122,
                  height: 122,
                  color: cardColor,
                  child: const Icon(
                    Icons.image,
                    color: Colors.white38,
                    size: 35,
                  ),
                );
              },
            ),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['title']!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    height: 1.65,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  item['date']!,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.75),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),
          GestureDetector(
            onTap: () {
              setState(() {
                if (bookmarkedNews.contains(index)) {
                  bookmarkedNews.remove(index);
                } else {
                  bookmarkedNews.add(index);
                }
              });
            },
            child: Icon(
              bookmarkedNews.contains(index)
                  ? Icons.bookmark
                  : Icons.bookmark_border,
              color: bookmarkedNews.contains(index)
                  ? orangeColor
                  : mutedColor,
              size: 42,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTrendingCard(int index) {
    return Container(
      width: 360,
      margin: const EdgeInsets.only(right: 36),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Image.asset(
              trendingImages[index],
              height: 260,
              width: 470,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 260,
                  width: 470,
                  color: cardColor,
                  child: const Icon(
                    Icons.image,
                    color: Colors.white38,
                    size: 45,
                  ),
                );
              },
            ),
            Container(
              width: 470,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.85),
                  ],
                ),
              ),
              child: Text(
                trendingTitles[index],
                maxLines: 2,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBottomItem(
    IconData icon,
    int index,
  ) {
    final bool selected = selectedBottom == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedBottom = index;
        });
      },
      child: SizedBox(
        width: 90,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: selected ? const Color(0xFF3878FF) : mutedColor,
              size: 42,
            ),
            const SizedBox(height: 8),
            if (selected)
              Container(
                width: 9,
                height: 9,
                decoration: const BoxDecoration(
                  color: Color(0xFF3878FF),
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 40,
              left: 46,
              right: 0,
              bottom: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search bar
                Padding(
                  padding: const EdgeInsets.only(right: 48),
                  child: Container(
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          size: 40,
                          color: mutedColor,
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: TextField(
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText:
                                  'Search for news, team, match, etc...',
                              hintStyle: TextStyle(
                                color: mutedColor,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Sports categories
                SizedBox(
                  height: 70,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: sports.length,
                    itemBuilder: (context, index) {
                      return buildSportTab(index);
                    },
                  ),
                ),

                const SizedBox(height: 10),

                // Latest news
                Padding(
                  padding: const EdgeInsets.only(right: 42),
                  child: Column(
                    children: List.generate(
                      news.length,
                      (index) => buildNewsItem(index),
                    ),
                  ),
                ),

                const SizedBox(height: 5),

                // Trending news heading
                const Text(
                  'Trending News',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 10),

                // Trending news horizontal cards
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: trendingImages.length,
                    itemBuilder: (context, index) {
                      return buildTrendingCard(index);
                    },
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),

      // Bottom navigation bar
     
    );
  }
}