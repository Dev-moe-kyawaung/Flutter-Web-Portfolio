import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 32),
      color: const Color(0xFF0F0F1E),
      child: Column(
        children: [
          Text(
            'About Me',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 48),
          
          LayoutBuilder(
            builder: (context, constraints) {
              bool isLargeScreen = constraints.maxWidth > 800;
              
              return isLargeScreen
                  ? Row(
                      children: [
                        Expanded(
                          child: _buildAboutContent(),
                        ),
                        const SizedBox(width: 48),
                        Expanded(
                          child: _buildSkillsGrid(),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        _buildAboutContent(),
                        const SizedBox(height: 48),
                        _buildSkillsGrid(),
                      ],
                    );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAboutContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'I\'m a passionate mobile and web developer with expertise in Flutter, Kotlin, and modern web technologies. I love building beautiful and functional applications that solve real-world problems.',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 16,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'My Journey',
          style: TextStyle(
            color: Colors.cyan,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          '• Started learning Flutter in 2022\n'
          '• Built 15+ mobile applications\n'
          '• Explored Kotlin & Backend development\n'
          '• Created multiple web projects\n'
          '• Always learning new technologies',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 14,
            height: 1.8,
          ),
        ),
      ],
    );
  }

  Widget _buildSkillsGrid() {
    final skills = [
      'Flutter',
      'Dart',
      'Kotlin',
      'Firebase',
      'REST API',
      'HTML/CSS',
      'JavaScript',
      'Git',
      'React',
      'Node.js',
      'SQL',
      'UI/UX Design',
    ];

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: skills.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.cyan, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Text(
            skills[index],
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.cyan,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      },
    );
  }
}
