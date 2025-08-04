// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(ExamApp());
// }

// class ExamApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoApp(
//       title: 'IELTS PREP',
//       theme: AppTheme.cupertinoTheme,
//       home: MainScreen(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// // Theme Configuration
// class AppTheme {
//   static const Color primaryColor = CupertinoColors.systemBlue;
//   static const Color secondaryColor = CupertinoColors.systemGreen;
//   static const Color accentColor = CupertinoColors.systemOrange;
//   static const Color backgroundColor = CupertinoColors.systemBackground;
//   static const Color surfaceColor = CupertinoColors.systemBackground;
//   static const Color errorColor = CupertinoColors.systemRed;

//   static final cupertinoTheme = CupertinoThemeData(
//     brightness: Brightness.light,
//     primaryColor: primaryColor,
//     barBackgroundColor: CupertinoColors.systemBackground,
//     scaffoldBackgroundColor: CupertinoColors.systemBackground,
//     textTheme: CupertinoTextThemeData(
//       primaryColor: primaryColor,
//       navTitleTextStyle: TextStyle(
//         fontSize: 20,
//         fontWeight: FontWeight.w600,
//         color: CupertinoColors.label,
//       ),
//     ),
//   );

//   static final darkTheme = CupertinoThemeData(
//     brightness: Brightness.dark,
//     primaryColor: primaryColor,
//     barBackgroundColor: CupertinoColors.systemBackground.darkColor,
//     scaffoldBackgroundColor: CupertinoColors.systemBackground.darkColor,
//     textTheme: CupertinoTextThemeData(
//       primaryColor: primaryColor,
//       navTitleTextStyle: TextStyle(
//         fontSize: 20,
//         fontWeight: FontWeight.w600,
//         color: CupertinoColors.label.darkColor,
//       ),
//     ),
//   );
// }

// class MainScreen extends StatefulWidget {
//   @override
//   _MainScreenState createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   int selectedIndex = 0;

//   final List<ExamSection> sections = [
//     ExamSection(
//       title: 'Listening',
//       icon: CupertinoIcons.headphones,
//       color: CupertinoColors.systemPurple,
//       description: 'Audio comprehension tests',
//     ),
//     ExamSection(
//       title: 'Reading',
//       icon: CupertinoIcons.book,
//       color: CupertinoColors.systemTeal,
//       description: 'Reading comprehension exercises',
//     ),
//     ExamSection(
//       title: 'Writing',
//       icon: CupertinoIcons.pencil_outline,
//       color: CupertinoColors.systemGreen,
//       description: 'Written expression tasks',
//     ),
//     ExamSection(
//       title: 'Speaking',
//       icon: CupertinoIcons.mic,
//       color: CupertinoColors.systemOrange,
//       description: 'Oral communication practice',
//     ),
//     ExamSection(
//       title: 'Complete Test',
//       icon: CupertinoIcons.checkmark_seal,
//       color: CupertinoColors.systemRed,
//       description: 'Full examination simulation',
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoTabScaffold(
//       tabBar: CupertinoTabBar(
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(CupertinoIcons.home),
//             label: 'Home',
//           ),
//           ...sections.map(
//             (section) => BottomNavigationBarItem(
//               icon: Icon(section.icon),
//               label: section.title,
//             ),
//           ),
//         ],
//         currentIndex: selectedIndex == -1 ? 0 : selectedIndex + 1,
//         onTap: (index) {
//           setState(() {
//             selectedIndex = index == 0 ? -1 : index - 1;
//           });
//         },
//         activeColor: AppTheme.primaryColor,
//         inactiveColor: CupertinoColors.systemGrey,
//       ),
//       tabBuilder: (context, index) {
//         return CupertinoTabView(
//           builder: (context) {
//             return CupertinoPageScaffold(
//               navigationBar: CupertinoNavigationBar(
//                 middle: Text('IELTS PREP'),
//                 trailing: selectedIndex != -1
//                     ? CupertinoButton(
//                         padding: EdgeInsets.zero,
//                         child: Text('Home'),
//                         onPressed: () {
//                           setState(() {
//                             selectedIndex = -1;
//                           });
//                         },
//                       )
//                     : null,
//               ),
//               child: SafeArea(
//                 child: selectedIndex == -1
//                     ? _buildMainDashboard()
//                     : PracticeTestsScreen(section: sections[selectedIndex]),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }

//   Widget _buildMainDashboard() {
//     return CustomScrollView(
//       slivers: [
//         SliverToBoxAdapter(
//           child: Padding(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 _buildHeader(),
//                 const SizedBox(height: 32),
//                 _buildStatsCards(),
//               ],
//             ),
//           ),
//         ),
//         SliverPadding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           sliver: _buildSectionGrid(),
//         ),
//       ],
//     );
//   }

//   Widget _buildHeader() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Welcome back!',
//           style: TextStyle(fontSize: 16, color: CupertinoColors.secondaryLabel),
//         ),
//         const SizedBox(height: 8),
//         Text(
//           'IELTS PREP',
//           style: TextStyle(
//             fontSize: 28,
//             fontWeight: FontWeight.bold,
//             color: AppTheme.primaryColor,
//           ),
//         ),
//         const SizedBox(height: 16),
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//           decoration: BoxDecoration(
//             color: AppTheme.primaryColor.withOpacity(0.1),
//             borderRadius: BorderRadius.circular(12),
//             border: Border.all(color: AppTheme.primaryColor.withOpacity(0.2)),
//           ),
//           child: Row(
//             children: [
//               Icon(CupertinoIcons.book, color: AppTheme.primaryColor),
//               const SizedBox(width: 12),
//               Expanded(
//                 child: Text(
//                   'Your next exam is in 15 days. Keep practicing!',
//                   style: TextStyle(
//                     color: AppTheme.primaryColor,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildStatsCards() {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final isTablet = constraints.maxWidth > 600;
//         return GridView.count(
//           shrinkWrap: true,
//           physics: const NeverScrollableScrollPhysics(),
//           crossAxisCount: isTablet ? 3 : 2,
//           childAspectRatio: isTablet ? 1.5 : 1.2,
//           crossAxisSpacing: 16,
//           mainAxisSpacing: 16,
//           children: [
//             _buildStatCard(
//               'Tests Completed',
//               '47',
//               CupertinoIcons.checkmark_circle,
//               AppTheme.secondaryColor,
//             ),
//             _buildStatCard(
//               'Average Score',
//               '82%',
//               CupertinoIcons.chart_bar_alt_fill,
//               AppTheme.accentColor,
//             ),
//             if (isTablet)
//               _buildStatCard(
//                 'Study Streak',
//                 '12 days',
//                 CupertinoIcons.flame,
//                 AppTheme.errorColor,
//               ),
//           ],
//         );
//       },
//     );
//   }

//   Widget _buildStatCard(
//     String title,
//     String value,
//     IconData icon,
//     Color color,
//   ) {
//     return Container(
//       decoration: BoxDecoration(
//         color: CupertinoColors.systemBackground,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: CupertinoColors.systemGrey.withOpacity(0.2),
//             blurRadius: 4,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, size: 32, color: color),
//             const SizedBox(height: 12),
//             Text(
//               value,
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 4),
//             Text(
//               title,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 12,
//                 color: CupertinoColors.secondaryLabel,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   SliverGrid _buildSectionGrid() {
//     return SliverGrid(
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         childAspectRatio: 0.9,
//         crossAxisSpacing: 16,
//         mainAxisSpacing: 16,
//       ),
//       delegate: SliverChildBuilderDelegate((context, index) {
//         return _buildSectionCard(sections[index], index);
//       }, childCount: sections.length),
//     );
//   }

//   Widget _buildSectionCard(ExamSection section, int index) {
//     return CupertinoButton(
//       onPressed: () => setState(() => selectedIndex = index),
//       padding: EdgeInsets.zero,
//       child: Container(
//         decoration: BoxDecoration(
//           color: CupertinoColors.systemBackground,
//           borderRadius: BorderRadius.circular(12),
//           boxShadow: [
//             BoxShadow(
//               color: CupertinoColors.systemGrey.withOpacity(0.2),
//               blurRadius: 4,
//               offset: Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: section.color.withOpacity(0.1),
//                   shape: BoxShape.circle,
//                 ),
//                 child: Icon(section.icon, size: 32, color: section.color),
//               ),
//               const SizedBox(height: 16),
//               Text(
//                 section.title,
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 section.description,
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: CupertinoColors.secondaryLabel,
//                 ),
//                 textAlign: TextAlign.center,
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class PracticeTestsScreen extends StatelessWidget {
//   final ExamSection section;

//   const PracticeTestsScreen({Key? key, required this.section})
//     : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final practiceTests = _generatePracticeTests(section.title);

//     return CustomScrollView(
//       slivers: [
//         SliverPadding(
//           padding: const EdgeInsets.all(20),
//           sliver: SliverList(
//             delegate: SliverChildListDelegate([
//               _buildSectionHeader(context),
//               const SizedBox(height: 24),
//               _buildProgressCard(),
//               const SizedBox(height: 24),
//               _buildTestsHeader(),
//             ]),
//           ),
//         ),
//         SliverPadding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           sliver: _buildTestsList(practiceTests),
//         ),
//       ],
//     );
//   }

//   Widget _buildSectionHeader(BuildContext context) {
//     return Row(
//       children: [
//         Container(
//           padding: const EdgeInsets.all(12),
//           decoration: BoxDecoration(
//             color: section.color.withOpacity(0.1),
//             shape: BoxShape.circle,
//           ),
//           child: Icon(section.icon, color: section.color, size: 24),
//         ),
//         const SizedBox(width: 16),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 section.title,
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 section.description,
//                 style: TextStyle(color: CupertinoColors.secondaryLabel),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildProgressCard() {
//     return Container(
//       decoration: BoxDecoration(
//         color: CupertinoColors.systemBackground,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: CupertinoColors.systemGrey.withOpacity(0.2),
//             blurRadius: 4,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Your Progress',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 Text(
//                   '68%',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: section.color,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),
//             LinearProgressIndicator(
//               value: 0.68,
//               backgroundColor: Colors.grey[200],
//               valueColor: AlwaysStoppedAnimation<Color>(section.color),
//             ),

//             const SizedBox(height: 12),
//             Text(
//               '12 of 18 tests completed',
//               style: TextStyle(color: CupertinoColors.secondaryLabel),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTestsHeader() {
//     return Text(
//       'Practice Tests',
//       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//     );
//   }

//   SliverList _buildTestsList(List<PracticeTest> tests) {
//     return SliverList(
//       delegate: SliverChildBuilderDelegate((context, index) {
//         return Padding(
//           padding: const EdgeInsets.only(bottom: 12),
//           child: _buildTestCard(tests[index]),
//         );
//       }, childCount: tests.length),
//     );
//   }

//   Widget _buildTestCard(PracticeTest test) {
//     return CupertinoListTile(
//       leading: Container(
//         width: 48,
//         height: 48,
//         decoration: BoxDecoration(
//           color: _getStatusColor(test.status).withOpacity(0.1),
//           shape: BoxShape.circle,
//         ),
//         child: Icon(
//           _getStatusIcon(test.status),
//           color: _getStatusColor(test.status),
//         ),
//       ),
//       title: Text(
//         test.title,
//         style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//       ),
//       subtitle: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             '${test.questions} questions • ${test.duration} min',
//             style: TextStyle(
//               color: CupertinoColors.secondaryLabel,
//               fontSize: 14,
//             ),
//           ),
//           if (test.score != null) ...[
//             const SizedBox(height: 4),
//             Text(
//               'Score: ${test.score}%',
//               style: TextStyle(
//                 color: _getStatusColor(test.status),
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ],
//         ],
//       ),
//       trailing: Icon(
//         CupertinoIcons.chevron_right,
//         size: 16,
//         color: CupertinoColors.secondaryLabel,
//       ),
//       onTap: () {
//         // Handle test selection
//       },
//     );
//   }

//   Color _getStatusColor(TestStatus status) {
//     switch (status) {
//       case TestStatus.completed:
//         return AppTheme.secondaryColor;
//       case TestStatus.inProgress:
//         return AppTheme.accentColor;
//       case TestStatus.locked:
//         return CupertinoColors.systemGrey;
//       case TestStatus.available:
//         return section.color;
//     }
//   }

//   IconData _getStatusIcon(TestStatus status) {
//     switch (status) {
//       case TestStatus.completed:
//         return CupertinoIcons.checkmark_alt_circle;
//       case TestStatus.inProgress:
//         return CupertinoIcons.play_circle;
//       case TestStatus.locked:
//         return CupertinoIcons.lock;
//       case TestStatus.available:
//         return CupertinoIcons.play;
//     }
//   }

//   List<PracticeTest> _generatePracticeTests(String sectionTitle) {
//     final List<String> testNames = [
//       'Basic Level Test',
//       'Intermediate Practice',
//       'Advanced Challenge',
//       'Mock Exam 1',
//       'Mock Exam 2',
//       'Diagnostic Test',
//       'Speed Test',
//       'Comprehensive Review',
//       'Final Practice',
//     ];

//     return testNames.asMap().entries.map((entry) {
//       final index = entry.key;
//       final name = entry.value;

//       TestStatus status;
//       int? score;

//       if (index < 4) {
//         status = TestStatus.completed;
//         score = 75 + (index * 5);
//       } else if (index == 4) {
//         status = TestStatus.inProgress;
//       } else if (index > 6) {
//         status = TestStatus.locked;
//       } else {
//         status = TestStatus.available;
//       }

//       return PracticeTest(
//         title: '$sectionTitle - $name',
//         questions: 20 + (index * 5),
//         duration: 30 + (index * 10),
//         status: status,
//         score: score,
//       );
//     }).toList();
//   }
// }

// // Data Models
// class ExamSection {
//   final String title;
//   final IconData icon;
//   final Color color;
//   final String description;

//   ExamSection({
//     required this.title,
//     required this.icon,
//     required this.color,
//     required this.description,
//   });
// }

// class PracticeTest {
//   final String title;
//   final int questions;
//   final int duration;
//   final TestStatus status;
//   final int? score;

//   PracticeTest({
//     required this.title,
//     required this.questions,
//     required this.duration,
//     required this.status,
//     this.score,
//   });
// }

// enum TestStatus { available, inProgress, completed, locked }
