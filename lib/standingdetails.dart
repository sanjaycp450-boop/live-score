import 'package:flutter/material.dart';

class LaLigaPage extends StatefulWidget {
  const LaLigaPage({super.key});

  @override
  State<LaLigaPage> createState() => _LaLigaPageState();
}

class _LaLigaPageState extends State<LaLigaPage> {
  int selectedTab = 1;

  final Color bgColor = const Color(0xFF191827);
  final Color cardBlue = const Color(0xFF172F59);
  final Color cardRed = const Color(0xFF481819);
  final Color orange = const Color(0xFFFF927F);

  final List<Map<String, dynamic>> teams = [
    {
      'name': 'Atlético Madrid',
      'logo': 'assets/atletico.png',
      'd': 2, 'l': 1, 'ga': 6, 'gd': 23, 'pts': 38,
      'color': 0,
    },
    {
      'name': 'Real Madrid',
      'logo': 'assets/d181082721d9bc2c79d44ba5dc56d7253a1a5062.png',
      'd': 4, 'l': 3, 'ga': 7, 'gd': 15, 'pts': 37,
      'color': 0,
    },
    {
      'name': 'Barcelona',
      'logo': 'assets/fad4a6f3e8cb80571fbec4db9175aeddcdb256fd.png',
      'd': 4, 'l': 4, 'ga': 9, 'gd': 20, 'pts': 34,
      'color': 0,
    },
    {
      'name': 'Villarreal',
      'logo': 'assets/Villareal.png',
      'd': 8, 'l': 2, 'ga': 10, 'gd': 16, 'pts': 32,
      'color': 1,
    },
    {
      'name': 'Real Sociedad',
      'logo': 'assets/584ad36ab519ea740933a8d3 1.png',
      'd': 6, 'l': 5, 'ga': 13, 'gd': 13, 'pts': 30,
      'color': 1,
    },
    {
      'name': 'Sevilla',
      'logo': 'assets/584ad291b519ea740933a8ba 1.png',
      'd': 3, 'l': 4, 'ga': 15, 'gd': 12, 'pts': 30,
      'color': 2,
    },
    {
      'name': 'Granada',
      'logo': 'assets/584ad13db519ea740933a897 1.png',
      'd': 3, 'l': 7, 'ga': 20, 'gd': 11, 'pts': 24,
      'color': 2,
    },
    {
      'name': 'Celta Vigo',
      'logo': 'assets/584ad3c4b519ea740933a8df 1.png',
      'd': 5, 'l': 7, 'ga': 25, 'gd': 8, 'pts': 23,
      'color': 2,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
        
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 35,
                vertical: 28,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Spain',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 25),
                ],
              ),
            ),

            const SizedBox(height: 15),

            // League logo
            Container(
              height: 185,
              width: 185,
              decoration: BoxDecoration(
                color: const Color(0xFF222131),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  'assets/1200px-LaLiga 4.png',
                  width: 155,
                  height: 155,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(height: 18),

            const Text(
              'La Liga',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 25),

   
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                children: [
                  _tabButton('All', 0),
                  const SizedBox(width: 18),
                  _tabButton('Home', 1),
                  const SizedBox(width: 18),
                  _tabButton('Away', 2),
                ],
              ),
            ),

            const SizedBox(height: 22),

            // Table heading
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                children: [
                  _heading('#', 32),
                  const Expanded(
                    child: Text(
                      'Team',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 23,
                      ),
                    ),
                  ),
                  _heading('D', 42),
                  _heading('L', 42),
                  _heading('Ga', 48),
                  _heading('Gd', 48),
                  _heading('Pts', 48),
                ],
              ),
            ),

            const SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Divider(
                color: Colors.white.withOpacity(0.10),
                height: 1,
              ),
            ),

            const SizedBox(height: 25),

 
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                itemCount: teams.length,
                itemBuilder: (context, index) {
                  final team = teams[index];

                  final Color rowColor =
                      team['color'] == 0
                          ? cardBlue
                          : team['color'] == 1
                              ? cardRed
                              : Colors.transparent;

                  return Container(
                    height: 38,
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: rowColor,
                      borderRadius: BorderRadius.circular(19),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 43,
                          child: Text(
                            '${index + 1}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                        ),

                        Image.asset(
                          team['logo'],
                          width: 26,
                          height: 26,
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return const SizedBox(
                              width: 26,
                              height: 26,
                            );
                          },
                        ),

                        const SizedBox(width: 15),

                        Expanded(
                          child: Text(
                            team['name'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                        ),

                        _value('${team['d']}', 42),
                        _value('${team['l']}', 42),
                        _value('${team['ga']}', 48),
                        _value('${team['gd']}', 48),
                        _value('${team['pts']}', 48),
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

  Widget _tabButton(String title, int index) {
    final bool selected = selectedTab == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = index;
        });
      },
      child: Container(
        height: 68,
        padding: const EdgeInsets.symmetric(horizontal: 38),
        decoration: BoxDecoration(
          color: selected ? orange : Colors.transparent,
          borderRadius: BorderRadius.circular(50),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight:
                selected ? FontWeight.w500 : FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _heading(String text, double width) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 22,
        ),
      ),
    );
  }

  Widget _value(String text, double width) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 22,
        ),
      ),
    );
  }
}