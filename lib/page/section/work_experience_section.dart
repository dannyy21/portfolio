import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class WorkExperienceSection extends StatefulWidget {
  const WorkExperienceSection({Key? key}) : super(key: key);

  @override
  _WorkExperienceSectionState createState() => _WorkExperienceSectionState();
}

class _WorkExperienceSectionState extends State<WorkExperienceSection>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late AnimationController _animationController;
  late Animation<double> _animation;

  final List<Map<String, String>> _workExperiences = [
    {
      'companyLogo': 'lib/assets/telkomindonesia.png',
      'companyName': 'PT Telkom Indonesia',
      'duration': 'March 2023 - Aug 2024',
      'location': 'Bandung, Indonesia',
      'projectLogo': 'lib/assets/diarium.png',
      'projectName': 'Diarium',
      'projectUrl': 'https://www.project1.com',
      'jobTitle': 'Flutter',
      'seniority': 'Senior',
      'imagePath': 'lib/assets/flutter.png'
    },
    {
      'companyLogo': 'lib/assets/telkomindonesia.png',
      'companyName': 'PT Telkom Indonesia',
      'duration': 'Aug 2023 - Dec 2022',
      'location': 'Bandung, Indonesia',
      'projectLogo': 'lib/assets/eventeer.png',
      'projectName': 'Eventeer',
      'projectUrl': 'https://www.project2.com',
      'jobTitle': 'React Native',
      'seniority': 'Junior',
      'imagePath': 'lib/assets/react.png'
    },
    {
      'companyLogo': 'lib/assets/swalogo.png',
      'companyName': 'PT Swamedia Informatika',
      'duration': 'March 2023 - Present',
      'location': 'Bandung, Indonesia',
      'projectLogo': 'lib/assets/peoplehub.png',
      'projectName': 'People Hub',
      'projectUrl': 'https://www.project3.com',
      'jobTitle': 'Flutter',
      'seniority': 'Junior',
      'imagePath': 'lib/assets/flutter.png'
    },
  ];

  @override
  void initState() {
    super.initState();

    // Animation controller for scroll-in effect
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..forward(); // Immediately forward the animation

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutQuad,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double screenWidth = constraints.maxWidth;

      double imageSize = screenWidth * 0.15;
      imageSize = imageSize.clamp(200, 200);
      const double containerHeight = 460;

      return Container(
        color: Colors.white,
        padding: const EdgeInsets.only(bottom: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 100),
              child: Text(
                'Work Experiences',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 16),
            FadeTransition(
              opacity: _animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.2),
                  end: Offset.zero,
                ).animate(_animationController),
                child: Column(
                  children: [
                    GestureDetector(
                      onHorizontalDragUpdate: (details) {
                        // Calculate the page change based on drag
                        double dragSensitivity =
                            2; // Adjust this value to control sensitivity
                        _pageController.jumpTo(_pageController.offset -
                            details.delta.dx * dragSensitivity);
                      },
                      child: Container(
                        height: containerHeight,
                        child: PageView.builder(
                          controller: _pageController,
                          onPageChanged: (index) {
                            setState(() {
                              _currentPage = index;
                            });
                          },
                          itemCount: _workExperiences.length,
                          itemBuilder: (context, index) {
                            final experience = _workExperiences[index];
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 100.0),
                              child: Container(
                                height: containerHeight,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF8F9FD),
                                  borderRadius: BorderRadius.circular(8),
                                  // border: Border.all(width: 1, color: Colors.grey),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // The company
                                      Expanded(
                                        child: _buildWorkExperienceItem(
                                          title: "The company",
                                          content: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              experience['companyLogo'] != null
                                                  ? Container(
                                                      width: imageSize,
                                                      height: imageSize,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                              experience[
                                                                  'companyLogo']!),
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    )
                                                  : Container(
                                                      width: imageSize,
                                                      height:
                                                          imageSize), // Fallback if no image
                                              const SizedBox(height: 8),
                                              Text(
                                                experience['companyName'] ??
                                                    'Unknown',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                experience['duration'] ?? 'N/A',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey[600],
                                                ),
                                              ),
                                              Text(
                                                experience['location'] ??
                                                    'Unknown',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey[600],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Icon(
                                        Icons.arrow_right_alt,
                                        size: 32,
                                        color: Colors.blueAccent,
                                      ),
                                      // The project
                                      Expanded(
                                        child: _buildWorkExperienceItem(
                                          title: "The project",
                                          content: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              experience['projectLogo'] != null
                                                  ? Container(
                                                      width: imageSize,
                                                      height: imageSize,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                              experience[
                                                                  'projectLogo']!),
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    )
                                                  : Container(
                                                      width: imageSize,
                                                      height:
                                                          imageSize), // Fallback if no image
                                              const SizedBox(height: 8),
                                              Text(
                                                experience['projectName'] ??
                                                    'Unknown',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              // Text(
                                              //   experience['projectUrl'] ??
                                              //       'N/A',
                                              //   style: const TextStyle(
                                              //     fontSize: 12,
                                              //     color: Colors.blueAccent,
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Icon(
                                        Icons.arrow_right_alt,
                                        size: 32,
                                        color: Colors.blueAccent,
                                      ),
                                      // Mobile Developer
                                      Expanded(
                                        child: _buildWorkExperienceItem(
                                          title: "Mobile Developer",
                                          content: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              experience['imagePath'] != null
                                                  ? Container(
                                                      width: imageSize,
                                                      height: imageSize,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                              experience[
                                                                  'imagePath']!),
                                                          fit: BoxFit.contain,
                                                        ),
                                                      ),
                                                    )
                                                  : Container(
                                                      width: imageSize,
                                                      height:
                                                          imageSize), // Fallback if no image
                                              const SizedBox(height: 8),
                                              Text(
                                                experience['jobTitle'] ??
                                                    'Unknown',
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Page Indicator Dots
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _workExperiences.length,
                        (index) => GestureDetector(
                          onTap: () {
                            _pageController.animateToPage(
                              index,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Container(
                            width: 10,
                            height: 10,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentPage == index
                                  ? Colors.blueAccent
                                  : Colors.grey[300],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildAnimatedContent(int index, Widget child) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: _currentPage == index ? 1.0 : 0.5,
      child: child,
    );
  }

  Widget _buildWorkExperienceItem({
    required String title,
    required Widget content,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
        const SizedBox(height: 8),
        content,
      ],
    );
  }
}
