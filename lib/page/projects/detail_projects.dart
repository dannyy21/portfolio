import 'package:flutter/material.dart';

class ProjectDetailPage extends StatelessWidget {
  final String title;
  final String description;
  final List<String>? imageUrls;
  final Map<String, dynamic> additionalInfo;
  final List<String>? taskResponsibilities;
  final List<String>? tech;
  final String header;
  final String? link;
  const ProjectDetailPage(
      {super.key,
      required this.title,
      required this.description,
      this.imageUrls,
      required this.additionalInfo,
      this.tech,
      this.link,
      required this.header,
      this.taskResponsibilities});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    String capitalize(String text) {
      if (text.isEmpty) return text;
      return text[0].toUpperCase() + text.substring(1);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 300, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  header,
                  fit: BoxFit.fill,
                  height: 600,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 24),

            Text(
              title,
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),

            Text(
              description,
              style: textTheme.bodyLarge?.copyWith(color: Colors.grey[800]),
            ),
            const SizedBox(height: 24),
            Text(
              "Tasks & Responsibilities",
              style: textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            taskResponsibilities != null && taskResponsibilities!.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: taskResponsibilities!
                        .map((task) => Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Text(
                                "• $task",
                                style: textTheme.bodyLarge
                                    ?.copyWith(color: Colors.grey[800]),
                              ),
                            ))
                        .toList())
                : Container(),

            const SizedBox(height: 24),

            // Additional Information
            if (additionalInfo.isNotEmpty) ...[
              Text(
                "Project Details",
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              ...additionalInfo.entries.map((entry) {
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
                        ...value.map((item) => Text(
                              "• $item",
                              style: textTheme.bodyLarge
                                  ?.copyWith(color: Colors.grey[800]),
                            ))
                      else
                        Text(
                          value.toString(),
                          style: textTheme.bodyMedium
                              ?.copyWith(color: Colors.grey[700]),
                        ),
                    ],
                  ),
                );
              }),
            ],
            const SizedBox(height: 24),
            if (tech != null && tech!.isNotEmpty) ...[
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
                    children: tech!
                        .map((item) => Text(
                              "• $item",
                              style: textTheme.bodyLarge
                                  ?.copyWith(color: Colors.grey[800]),
                            ))
                        .toList(),
                  )
                ],
              ),
            ],
            const SizedBox(height: 24),
            if (imageUrls != null && imageUrls!.isNotEmpty) ...[
              Text(
                "Gallery",
                style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              GridView.builder(
                itemCount: imageUrls?.length,
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
                      imageUrls?[index]?? "",
                      fit: BoxFit.fitHeight,
                    ),
                  );
                },
              ),
            ]else ...[
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
