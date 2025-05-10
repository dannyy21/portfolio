import 'package:flutter/material.dart';

class TechnicalExpertiseSection extends StatelessWidget {
  const TechnicalExpertiseSection({super.key});

  @override
  Widget build(BuildContext context) {
    final technicalExpertise = [
      {'title': 'Flutter & Dart Development', 'icon': Icons.code},
      {'title': 'State Management (Cubit, Redux)', 'icon': Icons.sync},
      {'title': 'REST API Integration', 'icon': Icons.cloud},
      {'title': 'UI/UX Implementation', 'icon': Icons.design_services},
      {'title': 'Firebase Integration', 'icon': Icons.cloud_upload},
      {'title': 'Local Storage', 'icon': Icons.storage},
      {'title': 'Version Control (Git)', 'icon': Icons.merge_type},
      {'title': 'Automated Testing', 'icon': Icons.bug_report},
      {'title': 'CI/CD Pipelines', 'icon': Icons.build},
      {'title': 'Performance Optimization', 'icon': Icons.speed},
    ];

    return Padding(
      padding: const EdgeInsets.only(right: 100, left:100, bottom:100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Title
          const Text(
            'Technical Expertise',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'My core technical skills include:',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade700,
            ),
          ),
          const SizedBox(height: 20),
          // Unified Skill List
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF8F9FD),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 6,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: technicalExpertise.length,
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey.shade300,
                height: 1,
                thickness: 1,
                indent: 16,
                endIndent: 16,
              ),
              itemBuilder: (context, index) {
                final skill = technicalExpertise[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  child: Row(
                    children: [
                      // Skill Icon with Background
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          skill['icon'] as IconData,
                          size: 28,
                          color: Color(0xFF3A86FF),
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Skill Title
                      Text(
                        skill['title'] as String,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
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
    );
  }
}
