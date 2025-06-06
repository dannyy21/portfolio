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

    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;

        // Adjust padding based on screen size
        double padding = screenWidth < 600 ? 16 : 100;
        double iconSize = screenWidth < 600 ? 40 : 56; // Adjust icon size for smaller screens
        double fontSize = screenWidth < 600 ? 12 : 14; // Adjust font size for smaller screens
        int crossAxisCount = screenWidth < 600 ? 2 : 4; // Dynamic grid columns based on screen width

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: padding, vertical: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                'Toolbox',
                style: TextStyle(
                  fontSize: screenWidth < 600 ? 22 : 28, // Adjust title font size
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'A collection of tools and platforms I use daily to craft applications:',
                style: TextStyle(
                  fontSize: fontSize,
                  color: Colors.grey.shade700,
                ),
              ),
              const SizedBox(height: 20),
              // Toolbox Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: tools.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount, // Adjust the number of columns
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
                          width: iconSize,
                          height: iconSize,
                          decoration: BoxDecoration(
                            color: Colors.tealAccent.withOpacity(0.3),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            tool['icon'] as IconData,
                            size: iconSize * 0.6, // Adjust icon size proportionally
                            color: Colors.teal,
                          ),
                        ),
                        const SizedBox(height: 12),
                        // Tool Name
                        Text(
                          tool['name'] as String,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: fontSize,
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
      },
    );
  }
}
