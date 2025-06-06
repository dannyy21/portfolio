import 'package:flutter/material.dart';

class ProjectDetailPage extends StatelessWidget {
  const ProjectDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final textTheme = Theme.of(context).textTheme;

    String capitalize(String text) {
      if (text.isEmpty) return text;
      return text[0].toUpperCase() + text.substring(1);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Image
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  arguments['header'] ?? '',  // Provide a fallback if header is null
                  fit: BoxFit.fill,
                  height: 600,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Project Title
            Text(
              arguments['title'] ?? 'No Title',  // Fallback if title is missing
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),

            // Project Description
            Text(
              arguments['description'] ?? 'No description available',
              style: textTheme.bodyLarge?.copyWith(color: Colors.grey[800]),
            ),
            const SizedBox(height: 24),

            // Tasks and Responsibilities
            if (arguments['taskResponsibilities'] != null && arguments['taskResponsibilities']!.isNotEmpty)
              Text(
                "Tasks & Responsibilities",
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            const SizedBox(height: 12),
            arguments['taskResponsibilities'] != null && arguments['taskResponsibilities']!.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: arguments['taskResponsibilities']!
                        .map<Widget>((task) => Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Text(
                                "• $task",
                                style: textTheme.bodyLarge?.copyWith(color: Colors.grey[800]),
                              ),
                            ))
                        .toList(),
                  )
                : Container(),

            const SizedBox(height: 24),

            // Additional Information Section
            if (arguments['additionalInfo'] != null && arguments['additionalInfo'].isNotEmpty) ...[
              Text(
                "Project Details",
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              ...arguments['additionalInfo'].entries.map<Widget>((entry) {
                final key = entry.key;
                final value = entry.value;

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        capitalize(key),
                        style: textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      if (value is List)
                        ...value.map<Widget>((item) => Text(
                              "• $item",
                              style: textTheme.bodyLarge?.copyWith(color: Colors.grey[800]),
                            ))
                      else
                        Text(
                          value.toString(),
                          style: textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
                        ),
                    ],
                  ),
                );
              }).toList(),
            ],

            const SizedBox(height: 24),

            // Technologies Used
            if (arguments['tech'] != null && arguments['tech']!.isNotEmpty) ...[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Technologies Used",
                    style: textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: arguments['tech']!
                        .map<Widget>((item) => Text(
                              "• $item",
                              style: textTheme.bodyLarge?.copyWith(color: Colors.grey[800]),
                            ))
                        .toList(),
                  )
                ],
              ),
            ],
            const SizedBox(height: 24),

            // Gallery
            if (arguments['imageUrls'] != null && arguments['imageUrls']!.isNotEmpty) ...[
              Text(
                "Gallery",
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              GridView.builder(
                itemCount: arguments['imageUrls']?.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 500,
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 24,
                  childAspectRatio: 2 / 3,
                ),
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      arguments['imageUrls']?[index] ?? "",
                      fit: BoxFit.fitHeight,
                    ),
                  );
                },
              ),
            ] else ...[
              Text(
                "There are no images available for this project due to privacy agreements and confidentiality terms",
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
