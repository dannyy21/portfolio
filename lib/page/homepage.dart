import 'package:flutter/material.dart';
import 'package:portfolio/page/section/about_section.dart';
import 'package:portfolio/page/section/contact_me_section.dart';
import 'package:portfolio/page/section/featured_projects_section.dart';
import 'package:portfolio/page/section/nav_bar_widget.dart';
import 'package:portfolio/page/section/personal_projects_section.dart';
import 'package:portfolio/page/section/skill_section.dart';
import 'package:portfolio/page/section/top_section.dart';
import 'package:portfolio/page/section/work_experience_section.dart';
import 'package:portfolio/theme/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  // Section keys for smooth-scroll navigation
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  String _activeSection = 'Home';

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final sections = {
      'Home': _heroKey,
      'About': _aboutKey,
      'Projects': _projectsKey,
      'Skills': _skillsKey,
      'Experience': _experienceKey,
      'Contact': _contactKey,
    };

    String current = 'Home';
    for (final entry in sections.entries) {
      final ctx = entry.value.currentContext;
      if (ctx == null) continue;
      final box = ctx.findRenderObject() as RenderBox;
      final pos = box.localToGlobal(Offset.zero, ancestor: null);
      if (pos.dy <= 200) {
        current = entry.key;
      }
    }

    if (current != _activeSection) {
      setState(() => _activeSection = current);
    }
  }

  void _scrollToSection(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Main scrollable content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // 70px spacer for fixed navbar
                const SizedBox(height: 0),
                TopSection(key: _heroKey),
                AboutSection(key: _aboutKey),
                FeaturedProjectsSection(key: _projectsKey),
                const PersonalProjectsSection(),
                SkillSetSection(key: _skillsKey),
                WorkExperienceSection(key: _experienceKey),
                ContactMeSection(key: _contactKey),
              ],
            ),
          ),

          // Fixed navbar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NavbarWidget(
              activeSection: _activeSection,
              onNavTap: (section) {
                switch (section) {
                  case 'Home':
                    _scrollToSection(_heroKey);
                    break;
                  case 'About':
                    _scrollToSection(_aboutKey);
                    break;
                  case 'Projects':
                    _scrollToSection(_projectsKey);
                    break;
                  case 'Skills':
                    _scrollToSection(_skillsKey);
                    break;
                  case 'Experience':
                    _scrollToSection(_experienceKey);
                    break;
                  case 'Contact':
                    _scrollToSection(_contactKey);
                    break;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
