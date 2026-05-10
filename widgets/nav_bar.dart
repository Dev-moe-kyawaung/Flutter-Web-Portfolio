import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  final Function(String) onNavigate;

  const NavBar({Key? key, required this.onNavigate}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      color: const Color(0xFF1A237E).withOpacity(0.95),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Text(
            'MK Dev',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.cyan,
              fontWeight: FontWeight.bold,
            ),
          ),
          
          // Nav Links (Desktop)
          if (MediaQuery.of(context).size.width > 600)
            Row(
              children: [
                _navLink('About'),
                _navLink('Projects'),
                _navLink('Contact'),
              ],
            ),
          
          // CTA Button
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.cyan,
            ),
            child: const Text(
              'Download CV',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget _navLink(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => widget.onNavigate(label),
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
