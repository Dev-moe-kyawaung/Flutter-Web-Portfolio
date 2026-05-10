import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLargeScreen = MediaQuery.of(context).size.width > 800;

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.8,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF1A237E),
            const Color(0xFF0D47A1),
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Avatar
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 3),
                image: const DecorationImage(
                  image: NetworkImage(
                    'https://www.gravatar.com/avatar/moekyawaung2026?s=200&d=identicon',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 32),
            
            // Name
            Text(
              'Moe Kya Waung',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Animated Text
            DefaultTextStyle(
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.cyan,
                fontWeight: FontWeight.w600,
              ) ?? const TextStyle(),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText('Flutter Developer'),
                  TypewriterAnimatedText('Mobile Engineer'),
                  TypewriterAnimatedText('Web Developer'),
                ],
                repeatForever: true,
                pause: const Duration(milliseconds: 1000),
              ),
            ),
            const SizedBox(height: 32),

            // CTA Button
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
              ),
              child: const Text(
                'View My Work',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
