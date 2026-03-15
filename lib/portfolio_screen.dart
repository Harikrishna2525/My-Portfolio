import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            children: [
              _buildHeroSection(context),
              _buildSkillsCarousel(context),
              _buildExperienceSection(context),
              _buildFocusSection(context),
              _buildProjectsSection(context),
              _buildFooter(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: isMobile ? 60 : 100,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF1E88E5),
            const Color(0xFF1565C0),
            const Color(0xFF0D47A1),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 1000),
            builder: (context, value, child) {
              return Transform.scale(
                scale: value,
                child: Container(
                  width: isMobile ? 120 : 160,
                  height: isMobile ? 120 : 160,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white,
                        Colors.white.withOpacity(0.95),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.3),
                        blurRadius: 30,
                        spreadRadius: 5,
                        offset: const Offset(0, 5),
                      ),
                    ],
                    border: Border.all(
                      color: Colors.white.withOpacity(0.5),
                      width: 3,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'HK',
                      style: GoogleFonts.poppins(
                        fontSize: isMobile ? 48 : 64,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()
                          ..shader = LinearGradient(
                            colors: [
                              const Color(0xFF1E88E5),
                              const Color(0xFF0D47A1),
                            ],
                          ).createShader(Rect.fromLTWH(0, 0, 200, 70)),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 32),
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 800),
            builder: (context, value, child) {
              return Transform.scale(
                scale: value,
                child: Text(
                  'Hari Krishna R',
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 36 : 56,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 24),
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 1.0, end: 1.1),
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeInOut,
            builder: (context, scale, child) {
              return Transform.scale(
                scale: scale,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFFFF9900),
                        const Color(0xFFFFBD00),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFFF9900).withOpacity(0.6),
                        blurRadius: 25,
                        spreadRadius: 3,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        FontAwesomeIcons.aws,
                        color: Colors.white,
                        size: 28,
                      ),
                      const SizedBox(width: 12),
                      Flexible(
                        child: Text(
                          'AWS Infrastructure & DevOps Engineer',
                          style: GoogleFonts.poppins(
                            fontSize: isMobile ? 14 : 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          Text(
            'AWS Infrastructure • CI/CD • Containers • High Availability • Auto-Healing • Serverless',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 14 : 18,
              color: Colors.white70,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 32),
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 1200),
            builder: (context, value, child) {
              return Opacity(
                opacity: value,
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.white.withOpacity(0.3), width: 2),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.architecture,
                        color: Colors.white,
                        size: 28,
                      ),
                      const SizedBox(width: 12),
                      Flexible(
                        child: Text(
                          'Designing Reliable & Scalable AWS Infrastructure', // ✅ CHANGED
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: isMobile ? 14 : 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsCarousel(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final skills = [
      {'name': 'AWS', 'icon': FontAwesomeIcons.aws, 'color': const Color(0xFFFF9900)},
      {'name': 'EC2', 'icon': Icons.cloud, 'color': const Color(0xFF1E88E5)},
      {'name': 'S3', 'icon': Icons.storage, 'color': const Color(0xFF569A31)},
      {'name': 'Lambda', 'icon': FontAwesomeIcons.bolt, 'color': const Color(0xFFFF9900)},
      {'name': 'API Gateway', 'icon': Icons.api, 'color': const Color(0xFF1E88E5)},
      {'name': 'DynamoDB', 'icon': Icons.storage, 'color': const Color(0xFF2053B4)},
      {'name': 'CloudFront (CDN)', 'icon': Icons.cloud_sync, 'color': const Color(0xFFFF9900)},
      {'name': 'CloudFormation', 'icon': Icons.layers, 'color': const Color(0xFFFF9900)},
      {'name': 'Load Balancer', 'icon': Icons.balance, 'color': const Color(0xFF42A5F5)},
      {'name': 'Auto Scaling', 'icon': Icons.trending_up, 'color': const Color(0xFF66BB6A)},
      {'name': 'Target Group', 'icon': Icons.group_work, 'color': const Color(0xFFAB47BC)},
      {'name': 'VPC', 'icon': Icons.settings_ethernet, 'color': const Color(0xFF1565C0)},
      {'name': 'Subnets', 'icon': Icons.device_hub, 'color': const Color(0xFF26A69A)},
      {'name': 'Route Tables', 'icon': Icons.alt_route, 'color': const Color(0xFFD4AF37)},
      {'name': 'IGW', 'icon': Icons.router, 'color': const Color(0xFFEF6C00)},
      {'name': 'CloudWatch', 'icon': Icons.monitor_heart, 'color': const Color(0xFFFF6F00)},
      {'name': 'IAM', 'icon': Icons.security, 'color': const Color(0xFF7E57C2)},
      {'name': 'Windows', 'icon': FontAwesomeIcons.windows, 'color': const Color(0xFF0078D4)},
      {'name': 'Ubuntu', 'icon': FontAwesomeIcons.ubuntu, 'color': const Color(0xFFE95420)},
      {'name': 'Linux', 'icon': FontAwesomeIcons.linux, 'color': const Color(0xFFFCC624)},
      {'name': 'Nginx', 'icon': FontAwesomeIcons.server, 'color': const Color(0xFF009639)},
      {'name': 'Git', 'icon': FontAwesomeIcons.git, 'color': const Color(0xFFF05032)},
      {'name': 'GitHub', 'icon': FontAwesomeIcons.github, 'color': const Color(0xFF181717)},
      {'name': 'Docker', 'icon': null, 'asset': 'assets/docker.png'},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Column(
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 600),
            builder: (context, value, child) {
              return Opacity(
                opacity: value,
                child: Transform.translate(
                  offset: Offset(0, 20 * (1 - value)),
                  child: Text(
                    'Cloud Infrastructure & DevOps Stack', // ✅ CHANGED
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 28 : 36,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1E88E5),
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 48),
          CarouselSlider(
            options: CarouselOptions(
              height: 220,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              enlargeCenterPage: true,
              viewportFraction: isMobile ? 0.7 : 0.22,
              enableInfiniteScroll: true,
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
            ),
            items: skills.map((skill) {
              return Builder(
                builder: (BuildContext context) {
                  return TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.8, end: 1.0),
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOut,
                    builder: (context, scale, child) {
                      return Transform.scale(
                        scale: scale,
                        child: Container(
                          width: 250,
                          margin: const EdgeInsets.symmetric(horizontal: 12),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (skill['icon'] != null)
                                  Icon(
                                    skill['icon'] as IconData,
                                    size: 64,
                                    color: skill['color'] as Color?,
                                  )
                                else if (skill['asset'] != null)
                                  Image.asset(
                                    skill['asset'] as String,
                                    width: 64,
                                    height: 64,
                                  ),
                                const SizedBox(height: 12),
                                Text(
                                  skill['name'] as String,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceSection(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: 60,
      ),
      color: const Color(0xFFF5F5F5),
      child: Column(
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 600),
            builder: (context, value, child) {
              return Opacity(
                opacity: value,
                child: Transform.translate(
                  offset: Offset(0, 20 * (1 - value)),
                  child: Text(
                    'Core Competencies',
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 28 : 36,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1E88E5),
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 48),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              _buildExperienceCard(
                'Cloud Infrastructure',
                'Production Systems',
                'VPC, ALB, Auto Scaling, EC2, IAM, CloudWatch, CloudFormation (IaC)',
                Icons.cloud_queue,
                const Color(0xFFFF9900),
                isMobile,
              ),
              _buildExperienceCard(
                'High Availability Design',
                'Multi-AZ Architecture',
                'Load Balancers, Health Checks, Auto-Healing, Fault Tolerance',
                Icons.architecture,
                const Color(0xFF1E88E5),
                isMobile,
              ),
              _buildExperienceCard(
                'Serverless Architecture',
                'Hands-on Production',
                'Lambda, API Gateway, DynamoDB, Event-Driven Systems',
                FontAwesomeIcons.bolt,
                const Color(0xFF7E57C2),
                isMobile,
              ),
              _buildExperienceCard(
                'Networking & Security',
                'Designed & Implemented',
                'VPC, Security Groups, IAM Policies, CORS, Route Tables',
                Icons.security,
                const Color(0xFF4CAF50),
                isMobile,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceCard(String title, String level, String description, IconData icon, Color color, bool isMobile) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.0, end: 1.0),
        duration: const Duration(milliseconds: 600),
        builder: (context, value, child) {
          return Transform.translate(
            offset: Offset(0, 20 * (1 - value)),
            child: Opacity(
              opacity: value,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: isMobile ? double.infinity : 280,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: color.withOpacity(0.2), width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: color.withOpacity(0.15),
                      blurRadius: 25,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0.0, end: 1.0),
                      duration: const Duration(milliseconds: 800),
                      builder: (context, iconValue, child) {
                        return Transform.scale(
                          scale: iconValue,
                          child: Icon(icon, size: 52, color: color),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [color.withOpacity(0.8), color],
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        level,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      description,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.black54,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProjectsSection(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: 60,
      ),
      child: Column(
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 600),
            builder: (context, value, child) {
              return Opacity(
                opacity: value,
                child: Transform.translate(
                  offset: Offset(0, 20 * (1 - value)),
                  child: Text(
                    'AWS Infrastructure Projects',
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 28 : 36,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1E88E5),
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 48),
          // ✅ CHANGED: Auto-Healing project description
          _buildProjectCard(
            context,
            'Auto-Healing Web Infrastructure on AWS',
            'Designed a highly available AWS infrastructure using VPC, Application Load Balancer, and Auto Scaling.\n\n'
                'Traffic is distributed across EC2 instances using ALB. If an instance becomes unhealthy or fails, the Auto Scaling Group automatically launches a replacement.\n\n'
                'CloudWatch monitoring is used to observe instance health, request metrics, and system behavior.',
            [
              'VPC',
              'ALB',
              'Auto Scaling',
              'EC2',
              'Health Checks',
              'IAM',
              'CloudWatch'
            ],
            null,
            Icons.autorenew,
            isMobile,
            diagram: _buildAutoHealingDiagram(),
          ),
          const SizedBox(height: 24),
          // ✅ CHANGED: Failure Testing project description
          _buildProjectCard(
            context,
            'Failure Testing & Observability',
            'Performed controlled failure testing by terminating EC2 instances and stopping application containers.\n\n'
                'Verified that ALB health checks marked instances unhealthy and Auto Scaling replaced them automatically.\n\n'
                'CloudWatch metrics were used to observe recovery behavior.',
            [
              'CloudWatch',
              'ALB Health Checks',
              'Auto Scaling',
              'Monitoring',
              'Resilience'
            ],
            null,
            Icons.monitor_heart,
            isMobile,
          ),
          // const SizedBox(height: 24),
          // // ✅ CHANGED: EC2 project - title, description, and NO live demo link
          // _buildProjectCard(
          //   context,
          //   'Production Deployment of Portfolio on AWS EC2',
          //   'Deployed the portfolio website on AWS EC2 using Nginx.\n\n'
          //       'Configured Elastic IP and DuckDNS for domain mapping and secured access using AWS Security Groups.\n\n'
          //       'Demonstrates basic production-style deployment and server management.',
          //   ['EC2', 'Nginx', 'Elastic IP', 'DuckDNS', 'Security Groups'],
          //   null, // ✅ REMOVED live demo link
          //   Icons.web,
          //   isMobile,
          // ),
          const SizedBox(height: 24),
          // ✅ CHANGED: S3 + CloudFront description
          _buildProjectCard(
            context,
            'Static Site Hosting with Global CDN',
            'Implemented static website hosting using Amazon S3 and CloudFront CDN.\n\n'
                'CloudFront caches content at edge locations to deliver files faster to global users and reduce latency.',
            ['S3', 'CloudFront', 'Static Hosting', 'Edge Caching'],
            'https://d3vc2jwe6irvyr.cloudfront.net/',
            Icons.storage,
            isMobile,
            diagram: _buildS3CloudFrontDiagram(),
          ),
          const SizedBox(height: 24),
          // ✅ CHANGED: Serverless API description
          _buildProjectCard(
            context,
            'Serverless API with Lambda & DynamoDB',
            'Built a serverless REST API using API Gateway, Lambda, and DynamoDB.\n\n'
                'API Gateway routes requests to Lambda functions, which process logic and store data in DynamoDB.\n\n'
                'This architecture scales automatically with usage.',
            ['Lambda', 'API Gateway', 'DynamoDB', 'CORS', 'Event-Driven'],
            null,
            FontAwesomeIcons.bolt,
            isMobile,
            diagram: _buildServerlessDiagram(),
          ),
          const SizedBox(height: 24),
          // ✅ NEW: CI/CD Pipeline section
          _buildProjectCard(
            context,
            'CI/CD Pipeline',
            'Automated application deployment using GitHub Actions and containerized workloads.\n\n'
                'The pipeline builds Docker images, tags them with the commit SHA, pushes the images to GitHub Container Registry (GHCR), and updates the AWS infrastructure.\n\n'
                'Pipeline Flow:\n'
                'git push → GitHub Actions CI pipeline → Docker image build → Push image to GHCR → CloudFormation infrastructure update → EC2 instances pull and run the new container',
            ['GitHub Actions', 'Docker', 'GHCR', 'CloudFormation', 'CI/CD', 'EC2'],
            null,
            Icons.rocket_launch,
            isMobile,
            diagram: _buildCiCdDiagram(),
          ),
          const SizedBox(height: 80),
          // ✅ CHANGED: Flutter section title
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 600),
            builder: (context, value, child) {
              return Opacity(
                opacity: value,
                child: Transform.translate(
                  offset: Offset(0, 20 * (1 - value)),
                  child: Text(
                    'Application Development Background (Flutter)', // ✅ CHANGED
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 24 : 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 48),
          // ✅ CHANGED: Single combined Flutter card (replaces 4 individual project cards)
          _buildProjectCard(
            context,
            'Cross-Platform Mobile App Development',
            'Before focusing on cloud infrastructure, I worked as a Flutter developer building cross-platform mobile applications for Android and iOS.\n\n'
                'These projects involved integrating REST APIs, managing application state, and deploying production mobile apps. This experience helps me understand application behaviour and deployment requirements when designing cloud infrastructure.',
            ['Flutter', 'REST APIs', 'Firebase', 'iOS', 'Android', 'Play Store'],
            null,
            Icons.phone_android,
            isMobile,
          ),
          const SizedBox(height: 24),
          // ✅ KEPT: AI-Based SaaS Apps (best two Flutter projects kept)
          _buildProjectCard(
            context,
            'AI-Based SaaS Applications',
            'Developed AI-powered mobile applications for plant and fish identification using Large Language models. Built for both iOS and Android platforms with real-time image recognition and detailed species information.',
            ['Flutter', 'AI', 'Firebase', 'LLM Models', 'iOS', 'Android', 'SaaS'],
            null,
            Icons.psychology,
            isMobile,
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(BuildContext context, String title, String description, List<String> technologies, String? link, IconData icon, bool isMobile, {Widget? diagram}) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 800),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 30 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: double.infinity,
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFF1E88E5).withOpacity(0.3), width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF1E88E5).withOpacity(0.2),
                      blurRadius: 30,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1E88E5).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(icon, color: const Color(0xFF1E88E5), size: 28),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            title,
                            style: GoogleFonts.poppins(
                              fontSize: isMobile ? 18 : 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      description,
                      style: GoogleFonts.poppins(
                        fontSize: isMobile ? 14 : 16,
                        color: Colors.black54,
                        height: 1.6,
                      ),
                    ),
                    if (diagram != null) ...[
                      const SizedBox(height: 24),
                      diagram,
                      const SizedBox(height: 8),
                    ],
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: technologies.map((tech) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color(0xFF1E88E5),
                                const Color(0xFF1565C0),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF1E88E5).withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Text(
                            tech,
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    if (link != null) ...[
                      const SizedBox(height: 16),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: InkWell(
                          onTap: () async {
                            final uri = Uri.parse(link);
                            if (await canLaunchUrl(uri)) {
                              await launchUrl(uri);
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  const Color(0xFF1E88E5),
                                  const Color(0xFF1565C0),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFF1E88E5).withOpacity(0.4),
                                  blurRadius: 15,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.launch, color: Colors.white, size: 20),
                                const SizedBox(width: 10),
                                Text(
                                  'View Live Demo',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAutoHealingDiagram() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F7FF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF1E88E5).withOpacity(0.25), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Architecture Overview',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF1E88E5),
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Column(
              children: [
                _diagBox('User / Browser', Icons.person_outline, const Color(0xFF5C6BC0)),
                _diagArrow(),
                _diagBox('Internet Gateway (IGW)', Icons.router_outlined, const Color(0xFFEF6C00)),
                _diagArrow(),
                _diagBox('Application Load Balancer', Icons.balance, const Color(0xFF1E88E5)),
                _diagArrowText('Health Checks'),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFF66BB6A).withOpacity(0.6), width: 1.5),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Auto Scaling Group',
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF2E7D32),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _diagSmallBox('EC2\nInstance', Icons.cloud, const Color(0xFF1E88E5)),
                          const SizedBox(width: 12),
                          _diagSmallBox('EC2\nInstance', Icons.cloud, const Color(0xFF1E88E5)),
                          const SizedBox(width: 12),
                          _diagSmallBox('EC2\n(Auto)', Icons.autorenew, const Color(0xFF43A047)),
                        ],
                      ),
                    ],
                  ),
                ),
                _diagArrow(),
                _diagBox('CloudWatch (Monitoring)', Icons.monitor_heart_outlined, const Color(0xFFFF6F00)),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.info_outline, size: 14, color: Color(0xFF1E88E5)),
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  'If an EC2 instance fails, Auto Scaling launches a replacement automatically.',
                  style: GoogleFonts.poppins(fontSize: 12, color: Colors.black45, fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCiCdDiagram() {
    final steps = [
      {'label': 'Developer  git push', 'icon': Icons.code, 'color': const Color(0xFF5C6BC0)},
      {'label': 'GitHub Repository', 'icon': FontAwesomeIcons.github, 'color': const Color(0xFF181717)},
      {'label': 'GitHub Actions (CI Trigger)', 'icon': Icons.play_circle_outline, 'color': const Color(0xFF2196F3)},
      {'label': 'Docker Image Build', 'icon': Icons.build_outlined, 'color': const Color(0xFF0288D1)},
      {'label': 'Push to GHCR', 'icon': Icons.upload_outlined, 'color': const Color(0xFF6A1B9A)},
      {'label': 'CloudFormation Update', 'icon': Icons.layers_outlined, 'color': const Color(0xFFFF9900)},
      {'label': 'EC2 Pulls & Runs Container', 'icon': Icons.cloud_done_outlined, 'color': const Color(0xFF2E7D32)},
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F7FF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF1E88E5).withOpacity(0.25), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pipeline Flow',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF1E88E5),
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Column(
              children: [
                for (int i = 0; i < steps.length; i++) ...[
                  _diagBox(
                    steps[i]['label'] as String,
                    steps[i]['icon'] as IconData,
                    steps[i]['color'] as Color,
                  ),
                  if (i < steps.length - 1) _diagArrow(),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _diagBox(String label, IconData icon, Color color) {
    return Container(
      constraints: const BoxConstraints(minWidth: 240),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.4), width: 1.5),
        boxShadow: [
          BoxShadow(color: color.withOpacity(0.08), blurRadius: 6, offset: const Offset(0, 3)),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              label,
              style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  Widget _diagSmallBox(String label, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.4), width: 1.2),
      ),
      child: Column(
        children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget _diagArrow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black26, size: 28),
    );
  }

  Widget _diagArrowText(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Column(
        children: [
          Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black26, size: 28),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            decoration: BoxDecoration(
              color: const Color(0xFFE3F2FD),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              label,
              style: GoogleFonts.poppins(fontSize: 11, color: const Color(0xFF1E88E5), fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }

  Widget _buildS3CloudFrontDiagram() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F7FF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF1E88E5).withOpacity(0.25), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Architecture Overview',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF1E88E5),
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Column(
              children: [
                _diagBox('User Browser', Icons.web_outlined, const Color(0xFF5C6BC0)),
                _diagArrow(),
                _diagBox('CloudFront CDN\n(Edge Locations)', Icons.cloud_sync_outlined, const Color(0xFFFF9900)),
                _diagArrow(),
                _diagBox('S3 Bucket\n(Static Website)', Icons.storage_outlined, const Color(0xFF569A31)),
                _diagArrow(),
                _diagBox('Images / Videos / Assets', Icons.perm_media_outlined, const Color(0xFF26A69A)),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFE3F2FD),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.info_outline, size: 14, color: Color(0xFF1E88E5)),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    'CloudFront caches static content at edge locations and delivers files from the nearest edge node, reducing latency and improving global performance.',
                    style: GoogleFonts.poppins(fontSize: 12, color: Colors.black54, height: 1.5),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServerlessDiagram() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F7FF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF1E88E5).withOpacity(0.25), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Architecture Overview',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF1E88E5),
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Column(
              children: [
                _diagBox('Client / Frontend', Icons.phone_android_outlined, const Color(0xFF5C6BC0)),
                _diagArrowText('HTTP Request'),
                _diagBox('API Gateway', Icons.api_outlined, const Color(0xFF1E88E5)),
                _diagArrow(),
                _diagBox('Lambda Function\n(Business Logic)', FontAwesomeIcons.bolt, const Color(0xFFFF9900)),
                _diagArrow(),
                _diagBox('DynamoDB\n(Data Storage)', Icons.storage_outlined, const Color(0xFF2053B4)),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFE3F2FD),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.info_outline, size: 14, color: Color(0xFF1E88E5)),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    'API Gateway receives HTTP requests and routes them to Lambda functions which execute application logic. DynamoDB stores application data and scales automatically based on request load.',
                    style: GoogleFonts.poppins(fontSize: 12, color: Colors.black54, height: 1.5),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFocusSection(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final focusItems = [
      {'label': 'High Availability Architecture', 'icon': Icons.architecture},
      {'label': 'Auto-Healing Systems', 'icon': Icons.autorenew},
      {'label': 'Infrastructure as Code', 'icon': Icons.layers_outlined},
      {'label': 'CI/CD Automation', 'icon': Icons.rocket_launch_outlined},
      {'label': 'Containerisation', 'icon': FontAwesomeIcons.docker},
      {'label': 'Serverless Architectures', 'icon': FontAwesomeIcons.bolt},
      {'label': 'Observability & Monitoring', 'icon': Icons.monitor_heart_outlined},

    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: 60,
      ),
      color: const Color(0xFF0D47A1),
      child: Column(
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 600),
            builder: (context, value, child) {
              return Opacity(
                opacity: value,
                child: Transform.translate(
                  offset: Offset(0, 20 * (1 - value)),
                  child: Text(
                    'Infrastructure Design Focus',
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 28 : 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: focusItems.map((item) {
              return TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 600),
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white.withOpacity(0.25), width: 1.5),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            item['icon'] as IconData,
                            color: const Color(0xFFFFBD00),
                            size: 20,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            item['label'] as String,
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 800),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : 80,
              vertical: 48,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFF0D47A1),
                  const Color(0xFF1565C0),
                  const Color(0xFF1E88E5),
                ],
              ),
            ),
            child: Column(
              children: [
                Text(
                  'Get In Touch',
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Open to Cloud Infrastructure Engineering opportunities',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 36),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  alignment: WrapAlignment.center,
                  children: [
                    _buildFooterLink(
                      icon: FontAwesomeIcons.linkedin,
                      label: 'LinkedIn',
                      color: const Color(0xFF0A66C2),
                      url: 'https://www.linkedin.com/in/hari-krish-13300b27a/',
                    ),
                    _buildFooterLink(
                      icon: FontAwesomeIcons.github,
                      label: 'GitHub',
                      color: Colors.white,
                      url: 'https://github.com/Harikrishna2525',
                    ),
                    // _buildFooterLink(
                    //   icon: Icons.email_outlined,
                    //   label: 'Email',
                    //   color: const Color(0xFFFFBD00),
                    //   url: 'mailto:harikrish58027@gmail.com',
                    // ),
                    _buildFooterLink(
                      icon: Icons.description_outlined,
                      label: 'Resume',
                      color: const Color(0xFF66BB6A),
                      url: 'https://drive.google.com/file/d/1zqnUmifFaay8s_Di1eKNnS5hRUWiw9r-/view?usp=drive_link',
                    ),
                  ],
                ),
                const SizedBox(height: 36),
                Text(
                  '© 2025 Hari Krishna R. All rights reserved.',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white60,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildFooterLink({
    required IconData icon,
    required String label,
    required Color color,
    required String url,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
          onTap: () async {
            Uri uri;

            if (url.startsWith('mailto:')) {
              uri = Uri(
                scheme: 'mailto',
                path: 'harikrish58027@gmail.com',
              );
            } else {
              uri = Uri.parse(url);
            }

            await launchUrl(uri, mode: LaunchMode.externalApplication);
          },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.12),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color.withOpacity(0.5), width: 1.5),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: 10),
              Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}