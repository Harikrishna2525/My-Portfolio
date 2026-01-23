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
                          'CLOUD INFRASTRUCTURE ENGINEER',
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
            'Cloud Infrastructure • AWS • Auto-Healing • Serverless',
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
                          'Designing Resilient, Scalable & High-Availability Systems',
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
                    'Technologies & Tools',
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
          _buildProjectCard(
            context,
            'Auto-Healing Web Infrastructure on AWS',
            'Designed a highly available cloud infrastructure to eliminate single points of failure. '
                'Built a custom VPC (10.0.0.0/16) with public subnets across multiple Availability Zones. '
                'Application traffic is routed through an Application Load Balancer to EC2 instances '
                'managed by an Auto Scaling Group. When an instance becomes unhealthy or is terminated, '
                'the Auto Scaling Group automatically launches a replacement without manual intervention.',
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
          ),
          const SizedBox(height: 24),
          _buildProjectCard(
            context,
            'Failure Testing & Observability',
            'Performed failure testing by manually terminating EC2 instances and simulating application crashes. '
                'Verified that ALB health checks marked instances unhealthy and Auto Scaling automatically '
                'replaced them. Configured CloudWatch metrics and logs to monitor instance health, '
                'request count, and error rates.',
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
          const SizedBox(height: 24),
          _buildProjectCard(
            context,
            'Portfolio Website - EC2 Deployment',
            'Deployed a full-featured portfolio website on AWS EC2 with Nginx web server. Configured Elastic IP for static addressing and integrated DuckDNS for custom domain mapping. Implemented security groups and firewall rules for production-ready deployment.',
            ['EC2', 'Nginx', 'Elastic IP', 'DuckDNS', 'Security Groups'],
            'http://krishportfolio.duckdns.org/',
            Icons.web,
            isMobile,
          ),
          const SizedBox(height: 24),
          _buildProjectCard(
            context,
            'Static Site Hosting with Global CDN',
            'Configured S3 bucket for static website hosting and integrated CloudFront CDN for global content delivery with edge caching. Implemented video storage and streaming with optimized performance and reduced latency across regions.',
            ['S3', 'CloudFront', 'Static Hosting', 'Edge Caching'],
            'http://krishbucker.s3-website.eu-north-1.amazonaws.com/',
            Icons.storage,
            isMobile,
          ),
          const SizedBox(height: 24),
          _buildProjectCard(
            context,
            'Serverless API with Lambda & DynamoDB',
            'Built a serverless REST API using AWS Lambda, API Gateway, and DynamoDB. Implemented proper CORS configuration for cross-origin requests and optimized for scalability with pay-per-use pricing model. Designed event-driven architecture with automatic scaling.',
            ['Lambda', 'API Gateway', 'DynamoDB', 'CORS', 'Event-Driven'],
            null,
            FontAwesomeIcons.bolt,
            isMobile,
          ),
          const SizedBox(height: 80),
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 600),
            builder: (context, value, child) {
              return Opacity(
                opacity: value,
                child: Transform.translate(
                  offset: Offset(0, 20 * (1 - value)),
                  child: Text(
                    'Additional Flutter Development Experience',
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
          _buildProjectCard(
            context,
            'AI-Based SaaS Applications',
            'Developed AI-powered mobile applications for plant and fish identification using Large Language models. Built for both iOS and Android platforms with real-time image recognition and detailed species information.',
            ['Flutter', 'AI', 'Firebase', 'LLM Models', 'iOS', 'Android', 'SaaS'],
            null,
            Icons.psychology,
            isMobile,
          ),
          const SizedBox(height: 24),
          _buildProjectCard(
            context,
            'ERP & Garments Management System',
            'Comprehensive ERP solution for garments industry with inventory management, order tracking, production planning, and financial reporting. Cross-platform application for iOS and Android.',
            ['Flutter', 'ERP', 'Inventory', 'iOS', 'Android', 'Database'],
            null,
            Icons.business_center,
            isMobile,
          ),
          const SizedBox(height: 24),
          _buildProjectCard(
            context,
            'QR Code Scanning Application',
            'High-performance QR code scanning application with real-time data processing and validation. Supports multiple QR code formats and includes offline capability for both iOS and Android platforms.',
            ['Flutter', 'QR Scanner', 'Camera API', 'iOS', 'Android'],
            null,
            Icons.qr_code_scanner,
            isMobile,
          ),
          const SizedBox(height: 24),
          _buildProjectCard(
            context,
            'Published Apps on Play Store',
            'Successfully published and maintained 2+ Flutter applications on Google Play Store through manual deployment process. Managed app updates, user feedback, and performance optimization.',
            ['Flutter', 'Play Store', 'Deployment', 'App Management'],
            null,
            FontAwesomeIcons.googlePlay,
            isMobile,
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(BuildContext context, String title, String description, List<String> technologies, String? link, IconData icon, bool isMobile) {
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

  Widget _buildFooter(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 800),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 40),
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
                const SizedBox(height: 24),
                Text(
                  'Open to Cloud Infrastructure Engineering opportunities',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 32),
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
}