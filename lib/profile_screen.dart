
import 'package:flutter/material.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  int selectedTab = 0;
  int selectedBottom = 3;

  final Color backgroundColor = const Color(0xFF191827);
  final Color iconBackground = const Color(0xFF242333);
  final Color orangeColor = const Color(0xFFFF806B);
  final Color dividerColor = const Color(0xFF242333);
  final Color cardColor = const Color(0xFF242333);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: selectedTab,
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      const SizedBox(height: 28),

                      // Profile Image
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: 160,
                            height: 160,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/image 131.png',
                                width: 160,
                                height: 160,
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: iconBackground,
                                    alignment: Alignment.center,
                                    child: const Icon(
                                      Icons.person,
                                      color: Colors.white,
                                      size: 80,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 6,
                            right: 3,
                            child: Container(
                              width: 47,
                              height: 47,
                              decoration: BoxDecoration(
                                color: orangeColor,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: backgroundColor,
                                  width: 6,
                                ),
                              ),
                              child: const Icon(
                                Icons.edit_outlined,
                                color: Colors.white,
                                size: 27,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 19),

                      // Name
                      const Text(
                        'Brian Imanuel',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 4),

                      const Text(
                        '#YNWK till the end',
                        style: TextStyle(
                          color: Color(0xFFB8B7C0),
                          fontSize: 18,
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Profile Tabs
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
                              Tab(text: 'My Profile'),
                              Tab(text: 'Activity'),
                              Tab(text: 'Settings'),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Profile Details
                      if (selectedTab == 0)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 29),
                          child: Column(
                            children: [
                              _buildProfileItem(
                                icon: Icons.person_outline,
                                title: 'Name',
                                subtitle: 'Brian Imanuel',
                              ),
                              _buildProfileItem(
                                icon: Icons.mail_outline,
                                title: 'Email',
                                subtitle: 'brians213@gmail.com',
                                underline: true,
                              ),
                              _buildProfileItem(
                                icon: Icons.call_outlined,
                                title: 'Phone',
                                subtitle: '+62 821 560 641',
                              ),
                              _buildProfileItem(
                                icon: Icons.location_on_outlined,
                                title: 'Address',
                                subtitle: 'Long beach, California',
                                showDivider: false,
                              ),
                            ],
                          ),
                        )
                      else if (selectedTab == 1)
                        const Padding(
                          padding: EdgeInsets.all(30),
                          child: Center(
                            child: Text(
                              'Activity',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        )
                      else
                        const Padding(
                          padding: EdgeInsets.all(30),
                          child: Center(
                            child: Text(
                              'Settings',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                              ),
                            ),
                          ),
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

  // Profile Information Row
  Widget _buildProfileItem({
    required IconData icon,
    required String title,
    required String subtitle,
    bool underline = false,
    bool showDivider = true,
  }) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: Row(
            children: [
              Container(
                width: 61,
                height: 61,
                decoration: BoxDecoration(
                  color: iconBackground,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: const Color(0xFFE9E8F0),
                  size: 30,
                ),
              ),

              const SizedBox(width: 20),

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      subtitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: const Color(0xFFBDBCC5),
                        fontSize: 16,
                        decoration: underline
                            ? TextDecoration.underline
                            : TextDecoration.none,
                        decorationColor: const Color(0xFFBDBCC5),
                      ),
                    ),
                  ],
                ),
              ),

              const Icon(
                Icons.chevron_right,
                color: Colors.white,
                size: 30,
              ),
            ],
          ),
        ),

        if (showDivider)
          Padding(
            padding: const EdgeInsets.only(left: 81),
            child: Divider(
              height: 1,
              thickness: 1,
              color: dividerColor,
            ),
          ),
      ],
    );
  }
}
