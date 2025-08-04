import 'package:flutter/cupertino.dart';
import 'profile_screen.dart';

import '../models/exam_section.dart';
import '../widgets/header.dart';
import '../widgets/section_grid.dart';
import 'practice_tests_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = -1;
  int currentTabIndex = 0;

  final sections = <ExamSection>[
    ExamSection(
      title: 'Listening',
      description: 'Improve your IELTS listening skills',
      icon: CupertinoIcons.music_note,
      color: CupertinoColors.systemBlue,
    ),
    ExamSection(
      title: 'Reading',
      description: 'Practice academic and general reading',
      icon: CupertinoIcons.book,
      color: CupertinoColors.systemGreen,
    ),
    ExamSection(
      title: 'Writing',
      description: 'Practice task 1 and task 2 writing',
      icon: CupertinoIcons.pencil,
      color: CupertinoColors.systemOrange,
    ),
    ExamSection(
      title: 'Speaking',
      description: 'Get ready for your speaking test',
      icon: CupertinoIcons.mic,
      color: CupertinoColors.systemPurple,
    ),
    ExamSection(
      title: 'Complete Mock Test',
      description: 'Take a full IELTS mock test',
      icon: CupertinoIcons.doc_text_search,
      color: CupertinoColors.systemRed,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: currentTabIndex,
        onTap: (i) {
          setState(() {
            currentTabIndex = i;
            selectedIndex = -1;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Profile',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: const Text('IELTS Prep'),
                border: null,
                leading: currentTabIndex == 0 && selectedIndex != -1
                    ? CupertinoButton(
                        padding: EdgeInsets.zero,
                        child: const Icon(CupertinoIcons.back),
                        onPressed: () {
                          setState(() {
                            selectedIndex = -1;
                          });
                        },
                      )
                    : null,
              ),
              child: SafeArea(
                bottom: false,
                child: currentTabIndex == 0
                    ? (selectedIndex == -1
                          ? _buildDashboard()
                          : PracticeTestsScreen(
                              section: sections[selectedIndex],
                            ))
                    : _buildProfileTab(),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildDashboard() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: const [DashboardHeader(), SizedBox(height: 32)],
            ),
          ),
        ),
        SectionGrid(
          sections: sections,
          onSectionSelected: (i) => setState(() => selectedIndex = i),
        ),
      ],
    );
  }

  Widget _buildProfileTab() {
    return const ProfileScreen();
  }
}
