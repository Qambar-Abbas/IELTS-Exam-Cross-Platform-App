import 'package:flutter/cupertino.dart';
import '../models/exam_section.dart';

class SectionCard extends StatelessWidget {
  final ExamSection section;
  final VoidCallback onTap;

  const SectionCard({super.key, required this.section, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onTap,
      padding: EdgeInsets.zero,
      child: Container(
        decoration: BoxDecoration(
          color: CupertinoColors.systemBackground,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: CupertinoColors.systemGrey.withOpacity(0.2),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: section.color.withAlpha(26), // 10% opacity
                  shape: BoxShape.circle,
                ),
                child: Icon(section.icon, size: 32, color: section.color),
              ),

              const SizedBox(height: 16),
              Text(
                section.title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                section.description,
                style: TextStyle(
                  fontSize: 12,
                  color: CupertinoColors.secondaryLabel,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
