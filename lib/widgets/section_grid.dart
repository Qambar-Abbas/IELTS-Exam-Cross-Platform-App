import 'package:flutter/cupertino.dart';
import '../models/exam_section.dart';
import 'section_card.dart';

class SectionGrid extends StatelessWidget {
  final List<ExamSection> sections;
  final ValueChanged<int> onSectionSelected;
  final int crossAxisCount;
  final double childAspectRatio;

  const SectionGrid({
    super.key,
    required this.sections,
    required this.onSectionSelected,
    this.crossAxisCount = 2,
    this.childAspectRatio = 0.9,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final spacing = screenWidth * 0.04; // 4% of screen width

    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: spacing),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: childAspectRatio,
          crossAxisSpacing: spacing,
          mainAxisSpacing: spacing,
        ),
        delegate: SliverChildBuilderDelegate((_, idx) {
          return SectionCard(
            section: sections[idx],
            onTap: () => onSectionSelected(idx),
          );
        }, childCount: sections.length),
      ),
    );
  }
}
