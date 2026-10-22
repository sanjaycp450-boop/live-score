
import 'package:flutter/material.dart';
import 'search_screen.dart';


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
    {'icon': '🏀', 'name': 'Basketball'},
    {'icon': '🏈', 'name': 'Football'},
    {'icon': '⚾', 'name': 'Baseball'},
    {'icon': '🎾', 'name': 'Tennis'},
  ];

  final List<Map<String, String>> news = [
    {
      'image': 'assets/image 135.png',
      'title': 'Rumour Has It: Lampard’s position under threat, ...',
      'date': '04 JAN 2021, 14:16',
    },
    {
      'image': 'assets/articel5.png',
      'title': 'Arteta sees natural leader Tierney as a future, ...',
      'date': '04 JAN 2021, 05:30',
    },
    {
      'image': 'assets/articel2.png',
      'title': 'Athletic Bilbao to appoint Marcelino as coach until, ...',
      'date': '04 JAN 2021, 09:23',
    },
    {
      'image': 'assets/image 147.png',
      'title': 'Barcelona suffer too much late in games, says Ter Stegen',
      'date': '04 JAN 2021, 06:06',
    },
  ];

  final List<String> trendingImages = [
    'assets/articel4.png',
    'assets/articel6.png',
  ];

  final List<String> trendingTitles = [
    'Arsenal suffer defeat in a thrilling match',
    'Liverpool celebrate another big moment',
  ];

  final Set<int> bookmarkedNews = {};

  void openSearch() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SearchScreen()),
    );
  }

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
        height: 70,
        width: index == 0 ? 175 : 85,
        margin: const EdgeInsets.only(right: 14),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: selected ? orangeColor : cardColor,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              sports[index]['icon']!,
              style: const TextStyle(fontSize: 25),
            ),
            if (selected) ...[
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  sports[index]['name']!,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
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
    final bool bookmarked = bookmarkedNews.contains(index);

    return Padding(
      padding: const EdgeInsets.only(bottom: 28),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              item['image']!,
              width: 90,
              height: 90,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 90,
                  height: 90,
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
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['title']!,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    height: 1.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  item['date']!,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.65),
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () {
              setState(() {
                if (bookmarked) {
                  bookmarkedNews.remove(index);
                } else {
                  bookmarkedNews.add(index);
                }
              });
            },
            icon: Icon(
              bookmarked ? Icons.bookmark : Icons.bookmark_border,
              color: bookmarked ? orangeColor : mutedColor,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTrendingCard(int index) {
    return Container(
      width: 280,
      margin: const EdgeInsets.only(right: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              trendingImages[index],
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
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
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.all(16),
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
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBottomItem(IconData icon, int index, String label) {
    final bool selected = selectedBottom == index;

    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            selectedBottom = index;
          });

          if (index == 0 && Navigator.canPop(context)) {
            Navigator.pop(context);
          }
        },
        child: SizedBox(
          height: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: selected ? const Color(0xFF3878FF) : mutedColor,
                size: 28,
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  color: selected ? const Color(0xFF3878FF) : mutedColor,
                  fontSize: 11,
                ),
              ),
              const SizedBox(height: 3),
              if (selected)
                Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: Color(0xFF3878FF),
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
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
              top: 24,
              left: 20,
              right: 20,
              bottom: 25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search bar with ElevatedButton
                Container(
                  height: 58,
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                    color: cardColor,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, size: 28, color: mutedColor),
                      const SizedBox(width: 10),
                      Expanded(
                        child: GestureDetector(
                          onTap: openSearch,
                          child: Text(
                            'Search for news, team, match...',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: mutedColor, fontSize: 13),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: openSearch,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: orangeColor,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: const EdgeInsets.all(10),
                          minimumSize: const Size(42, 42),
                          shape: const CircleBorder(),
                        ),
                        child: const Icon(Icons.arrow_forward, size: 20,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Sports categories
                SizedBox(
                  height: 72,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: sports.length,
                    itemBuilder: (context, index) {
                      return buildSportTab(index);
                    },
                  ),
                ),

                const SizedBox(height: 24),

                // Latest news
                ...List.generate(news.length, (index) => buildNewsItem(index),
                ),

                const SizedBox(height: 8),

                // Trending news heading
                const Text(
                  'Trending News',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 16),

                // Trending news cards
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: trendingImages.length,
                    itemBuilder: (context, index) {
                      return buildTrendingCard(index);
                    },
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),

      // Bottom navigation bar
      // bottomNavigationBar: Container(
      //   decoration: BoxDecoration(
      //     color: const Color(0xFF222131),
      //     border: Border(
      //       top: BorderSide(color: Colors.white.withOpacity(0.06)),
      //     ),
      //   ),
      //   child: SafeArea(
      //     top: false,
      //     child: Row(
      //       children: [
      //         buildBottomItem(Icons.home_outlined, 0, 'Home'),
      //         buildBottomItem(Icons.explore_outlined, 1, 'Explore'),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
