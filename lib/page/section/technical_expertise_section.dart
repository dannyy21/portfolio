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

    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        double padding = screenWidth < 600 ? 16 : 100; // Adjust padding for mobile and larger screens
        double iconSize = screenWidth < 600 ? 40 : 48; // Adjust icon size for smaller screens
        double fontSize = screenWidth < 600 ? 14 : 16; // Adjust font size for smaller screens

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: padding, vertical: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Title
              Text(
                'Technical Expertise',
                style: TextStyle(
                  fontSize: screenWidth < 600 ? 22 : 28, // Adjust title font size for small screens
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'My core technical skills include:',
                style: TextStyle(
                  fontSize: fontSize,
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
                            width: iconSize,
                            height: iconSize,
                            decoration: BoxDecoration(
                              color: Colors.blueAccent.withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              skill['icon'] as IconData,
                              size: iconSize * 0.6, // Adjust icon size proportionally
                              color: Color(0xFF3A86FF),
                            ),
                          ),
                          const SizedBox(width: 16),
                          // Skill Title
                          Text(
                            skill['title'] as String,
                            style: TextStyle(
                              fontSize: fontSize,
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
      },
    );
  }
}
