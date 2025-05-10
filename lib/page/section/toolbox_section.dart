import 'package:flutter/material.dart';

class ToolboxSection extends StatelessWidget {
  const ToolboxSection({super.key});

  @override
  Widget build(BuildContext context) {
    final tools = [
      {'name': 'Visual Studio Code', 'icon': Icons.code},
      {'name': 'Android Studio', 'icon': Icons.android},
      {'name': 'Git', 'icon': Icons.merge_type},
      {'name': 'Postman', 'icon': Icons.http},
      {'name': 'Figma', 'icon': Icons.design_services},
      {'name': 'Firebase Console', 'icon': Icons.cloud},
      {'name': 'Click Up', 'icon': Icons.dashboard},
      {'name': 'Slack', 'icon': Icons.chat},
    ];

    return Padding(
      padding: const EdgeInsets.only(right: 100.0, left: 100, bottom: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          const Text(
            'Toolbox',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'A collection of tools and platforms I use daily to craft applications:',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade700,
            ),
          ),
          const SizedBox(height: 20),
          // Toolbox Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: tools.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, // 3 items per row
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              final tool = tools[index];
              return Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F7FA),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 6,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Tool Icon
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: Colors.tealAccent.withOpacity(0.3),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        tool['icon'] as IconData,
                        size: 32,
                        color: Colors.teal,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Tool Name
                    Text(
                      tool['name'] as String,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
