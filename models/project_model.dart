class Project {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final List<String> technologies;
  final String? githubUrl;
  final String? liveUrl;

  Project({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.technologies,
    this.githubUrl,
    this.liveUrl,
  });
}

// Sample Projects
List<Project> sampleProjects = [
  Project(
    id: '1',
    title: 'E-Commerce App',
    description: 'A full-featured e-commerce application built with Flutter and Firebase.',
    imageUrl: 'https://via.placeholder.com/400x300?text=E-Commerce+App',
    technologies: ['Flutter', 'Firebase', 'Provider'],
    githubUrl: 'https://github.com/Dev-moe-kyawaung',
  ),
  Project(
    id: '2',
    title: 'Weather App',
    description: 'Real-time weather application using OpenWeatherMap API.',
    imageUrl: 'https://via.placeholder.com/400x300?text=Weather+App',
    technologies: ['Flutter', 'REST API', 'Provider'],
    githubUrl: 'https://github.com/Dev-moe-kyawaung',
  ),
  Project(
    id: '3',
    title: 'Task Management System',
    description: 'A collaborative task management tool with real-time updates.',
    imageUrl: 'https://via.placeholder.com/400x300?text=Task+Manager',
    technologies: ['Kotlin', 'Ktor', 'MongoDB'],
    githubUrl: 'https://github.com/Dev-moe-kyawaung',
  ),
  Project(
    id: '4',
    title: 'Social Media Feed',
    description: 'Dynamic social media feed with image uploads and comments.',
    imageUrl: 'https://via.placeholder.com/400x300?text=Social+Feed',
    technologies: ['React', 'Node.js', 'MongoDB'],
    liveUrl: 'https://github.com/Dev-moe-kyawaung',
  ),
];
