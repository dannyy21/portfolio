import 'package:flutter/material.dart';

class PortfolioScreen extends StatefulWidget {
    const PortfolioScreen({Key? key}) : super(key: key);
  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Portfolio Title
              Center(
                child: Column(
                  children: [
                    const Text(
                      "My Portfolio",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Image.asset(
                      'assets/portfolio_icon.png', // Replace with your image path
                      height: 150,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Education & Skills Section
              const Text(
                "Education & Skills",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              _buildEducationItem(
                title: "TRANSNISTRIAN STATE UNIVERSITY",
                subtitle: "Master in Applied Mathematics and Computer Science",
                duration: "2017 - 2019",
              ),
              _buildEducationItem(
                title: "TRANSNISTRIAN STATE UNIVERSITY",
                subtitle: "Bachelor's degree/Applied Mathematics 4.8",
                duration: "2013 - 2017",
              ),

              const SizedBox(height: 40),

              // Work Experiences Section
              const Text(
                "Work Experiences",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              _buildWorkExperienceItem(
                companyLogo: "assets/wisent_logo.png", // Replace with your image
                company: "Wisent Group",
                project: "Everact.io",
                projectLink: "https://everact.io",
                jobTitle: "Lead Software Engineer Senior",
                location: "Chisinau, Moldova",
                duration: "Dec 2020 - Present",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEducationItem({required String title, required String subtitle, required String duration}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 6,
            backgroundColor: Colors.blue,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  duration,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkExperienceItem({
    required String companyLogo,
    required String company,
    required String project,
    required String projectLink,
    required String jobTitle,
    required String location,
    required String duration,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Company Column
          Column(
            children: [
              Image.asset(
                companyLogo,
                height: 50,
              ),
              const SizedBox(height: 8),
              Text(
                company,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                location,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          const Icon(Icons.arrow_forward, color: Colors.blue),
          // Project Column
          Column(
            children: [
              const Icon(Icons.web, color: Colors.blue, size: 40),
              const SizedBox(height: 8),
              Text(
                project,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                projectLink,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          const Icon(Icons.arrow_forward, color: Colors.blue),
          // Job Title Column
          Column(
            children: [
              const Icon(Icons.code, color: Colors.blue, size: 40),
              const SizedBox(height: 8),
              Text(
                jobTitle,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Text(
                duration,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
