import 'package:flutter/material.dart';
import 'package:portfolio/page/section/contact_me_section.dart';
import 'package:portfolio/page/section/skill_section.dart';
import 'package:portfolio/page/section/technical_expertise_section.dart';
import 'package:portfolio/page/section/toolbox_section.dart';
import 'package:portfolio/page/section/top_section.dart';
import 'package:portfolio/page/section/work_experience_section.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _portfolioEducationKey = GlobalKey();

  void _scrollToPortfolioEducation() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox renderBox = _portfolioEducationKey.currentContext!
          .findRenderObject() as RenderBox;
      final position = renderBox.localToGlobal(Offset.zero);
      _scrollController.animateTo(
        position.dy,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            TopSection(_scrollToPortfolioEducation),
            SkillSetSection(),
            WorkExperienceSection(),
            TechnicalExpertiseSection(),
            ToolboxSection(),
            ContactMeSection(),
          ],
        ),
      ),
    );
  }
}
