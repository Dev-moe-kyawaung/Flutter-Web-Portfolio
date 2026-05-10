import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({Key? key}) : super(key: key);

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _messageController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _messageController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 32),
      color: const Color(0xFF1A1A2E),
      child: Column(
        children: [
          Text(
            'Get In Touch',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 48),
          
          LayoutBuilder(
            builder: (context, constraints) {
              bool isLargeScreen = constraints.maxWidth > 900;
              
              return isLargeScreen
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _buildContactInfo()),
                        const SizedBox(width: 48),
                        Expanded(child: _buildContactForm()),
                      ],
                    )
                  : Column(
                      children: [
                        _buildContactInfo(),
                        const SizedBox(height: 48),
                        _buildContactForm(),
                      ],
                    );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Let\'s work together!',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        _contactItem(
          icon: Icons.email,
          label: 'Email',
          value: 'moe.kyawaung@example.com',
        ),
        const SizedBox(height: 16),
        _contactItem(
          icon: Icons.location_on,
          label: 'Location',
          value: 'Myanmar',
        ),
        const SizedBox(height: 16),
        _contactItem(
          icon: Icons.phone,
          label: 'Phone',
          value: '+95 9 xxxxxx',
        ),
        const SizedBox(height: 32),
        const Text(
          'Connect on Social Media:',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            _socialButton('GitHub', 'https://github.com/Dev-moe-kyawaung'),
            const SizedBox(width: 12),
            _socialButton('Gravatar', 'https://gravatar.com/moekyawaung2026'),
          ],
        ),
      ],
    );
  }

  Widget _contactItem({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.cyan),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _socialButton(String label, String url) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _launchURL(url),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.cyan),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            label,
            style: const TextStyle(color: Colors.cyan),
          ),
        ),
      ),
    );
  }

  Widget _buildContactForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Your Name',
              labelStyle: const TextStyle(color: Colors.cyan),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.cyan),
                borderRadius: BorderRadius.circular(4),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.cyan),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _emailController,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Your Email',
              labelStyle: const TextStyle(color: Colors.cyan),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.cyan),
                borderRadius: BorderRadius.circular(4),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.cyan),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _messageController,
            maxLines: 5,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              labelText: 'Your Message',
              labelStyle: const TextStyle(color: Colors.cyan),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.cyan),
                borderRadius: BorderRadius.circular(4),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.cyan),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter your message';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Message sent successfully!')),
                );
                _nameController.clear();
                _emailController.clear();
                _messageController.clear();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.cyan,
              padding: const EdgeInsets.symmetric(
                horizontal: 48,
                vertical: 16,
              ),
            ),
            child: const Text(
              'Send Message',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }
  }
}
