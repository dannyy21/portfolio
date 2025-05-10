import 'package:flutter/material.dart';

class SkillSetSection extends StatefulWidget {
  const SkillSetSection({Key? key}) : super(key: key);

  @override
  _SkillSetSectionState createState() => _SkillSetSectionState();
}

class _SkillSetSectionState extends State<SkillSetSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;

          double imageSize = screenWidth * 0.15;
          imageSize = imageSize.clamp(50, 80);

          double fontSize = imageSize / 5;

          return Column(
            children: [
              SlideTransition(
                position: _animation,
                child: Text(
                  'Skillset',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey.shade700,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: screenWidth * 0.05,
                runSpacing: screenWidth * 0.01,
                children: [
                  _buildSkillSet('lib/assets/flutterflow.jpg', "Flutter Flow",
                      imageSize, fontSize),
                  _buildSkillSet(
                      'lib/assets/flutter.png', "Flutter", imageSize, fontSize),
                  _buildSkillSet('lib/assets/react.png', "React Native",
                      imageSize, fontSize),
                  _buildSkillSet(
                      'lib/assets/kotlin.png', "Kotlin", imageSize, fontSize),
                  _buildSkillSet(
                      'lib/assets/swift.jpg', "Swift", imageSize, fontSize),
                ],
              ),
              const SizedBox(height: 48),
           
            ],
          );
        },
      ),
    );
  }
 
  Widget _buildSkillSet(
      String imagePath, String skillName, double imageSize, double fontSize) {
    return SlideTransition(
      position: _animation,
      child: Column(
        children: [
          Container(
            width: imageSize,
            height: imageSize,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            skillName,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }


}
