import 'package:flutter/material.dart';
import 'hero_section.dart';
import 'about_section.dart';
import 'projects_section.dart';
import 'contact_section.dart';
import '../widgets/nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  void _scrollToSection(String section) {
    // Scroll logic
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            NavBar(onNavigate: _scrollToSection),
            const HeroSection(),
            const AboutSection(),
            const ProjectsSection(),
            const ContactSection(),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      color: const Color(0xFF1A1A2E),
      child: Column(
        children: [
          const Text(
            '© 2024 Moe Kya Waung. All rights reserved.',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _socialIcon('GitHub', 'https://github.com/Dev-moe-kyawaung'),
              const SizedBox(width: 24),
              _socialIcon('Gravatar', 'https://gravatar.com/moekyawaung2026'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _socialIcon(String label, String url) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          // Open URL
        },
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
