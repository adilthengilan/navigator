import 'package:flutter/material.dart';

class CourseAppLayout extends StatefulWidget {
  const CourseAppLayout({super.key});

  @override
  State<CourseAppLayout> createState() => _CourseAppLayoutState();
}

class _CourseAppLayoutState extends State<CourseAppLayout> {
  int _selectedIndex = 1; // Dashboard selected by default

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar
          CourseSidebar(
            selectedIndex: _selectedIndex,
            onItemSelected: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),

          // Main content area
          Expanded(
            child: _getContentForIndex(_selectedIndex),
          ),
        ],
      ),
    );
  }

  Widget _getContentForIndex(int index) {
    switch (index) {
      case 1: // Dashboard
        return const CourseHomePage();
      default:
        return Container(
          color: Colors.grey[100],
          child: Center(
            child: Text(
              'Content for ${_getSidebarItemName(_selectedIndex)}',
              style: const TextStyle(fontSize: 24),
            ),
          ),
        );
    }
  }

  String _getSidebarItemName(int index) {
    switch (index) {
      case 0:
        return 'Course';
      case 1:
        return 'Dashboard';
      case 2:
        return 'Inbox';
      case 3:
        return 'Lesson';
      case 4:
        return 'Task';
      case 5:
        return 'Group';
      case 6:
        return 'Settings';
      case 7:
        return 'Logout';
      default:
        return 'Unknown';
    }
  }
}

class CourseSidebar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CourseSidebar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          // App logo
          _buildLogoItem(),

          // Main navigation items
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildNavItem(
                    icon: Icons.dashboard_outlined,
                    label: 'Dashboard',
                    index: 1,
                  ),
                  _buildNavItem(
                    icon: Icons.inbox_outlined,
                    label: 'Inbox',
                    index: 2,
                  ),
                  _buildNavItem(
                    icon: Icons.menu_book_outlined,
                    label: 'Lesson',
                    index: 3,
                  ),
                  _buildNavItem(
                    icon: Icons.assignment_outlined,
                    label: 'Task',
                    index: 4,
                  ),
                  _buildNavItem(
                    icon: Icons.people_outline,
                    label: 'Group',
                    index: 5,
                  ),
                  _buildContactItem(
                    image: 'assets/arabicperson.jpeg',
                    statusColor: Colors.green,
                  ),
                  _buildContactItem(
                    image: 'assets/manperson.jpeg',
                    statusColor: Colors.grey,
                  ),
                  _buildContactItem(
                    image: 'assets/capboy.jpeg',
                    statusColor: Colors.grey,
                  ),
                ],
              ),
            ),
          ),

          _buildNavItem(
            icon: Icons.settings_outlined,
            label: 'Settings',
            index: 6,
          ),
          _buildNavItem(
            icon: Icons.logout_outlined,
            label: 'Logout',
            index: 7,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildLogoItem() {
    return InkWell(
      onTap: () => onItemSelected(0),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF003366),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text(
                'C',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Course',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final bool isSelected = selectedIndex == index;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () => onItemSelected(index),
        child: Column(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFF003366).withOpacity(0.1)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: isSelected
                    ? const Color(0xFF003366)
                    : Colors.grey,
                size: 22,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: isSelected
                    ? const Color(0xFF003366)
                    : Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem({
    required String image,
    required Color statusColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage(image),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: statusColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1.5),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CourseHomePage extends StatelessWidget {
  const CourseHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsive layout
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Adjust card count based on screen width
    final crossAxisCount = screenWidth > 1200
        ? 4
        : (screenWidth > 900 ? 3 : (screenWidth > 600 ? 2 : 1));

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with user info
            _buildHeader(context),

            // Main content
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Featured Course Banner
                      _buildFeaturedBanner(screenWidth),

                      SizedBox(height: screenHeight * 0.02),

                      // Category Pills
                      _buildCategoryPills(),

                      const SizedBox(height: 24),

                      // Continue Watching Header
                      _buildSectionHeader('Continue Watching'),

                      const SizedBox(height: 16),

                      // Course Cards Grid
                      _buildCourseGrid(crossAxisCount),

                      const SizedBox(height: 24),

                      // Your Mentor Section
                      _buildMentorSection(),

                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Header with user info, search, and statistics
  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Row(
        children: [
          // Search Bar
          Expanded(
            flex: 3,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey[500], size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search courses...',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(width: 16),

          // Notification Icons
          Icon(Icons.notifications_none, color: Colors.grey[700]),
          const SizedBox(width: 16),
          Icon(Icons.bookmark_border, color: Colors.grey[700]),

          const SizedBox(width: 24),

          // User Info
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey[200],
                backgroundImage: AssetImage('assets/personimage.jpeg'),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Row(
                    children: [
                      Text(
                        'Good Morning, Jason!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.verified, color: Colors.blue, size: 16),
                    ],
                  ),
                  Text(
                    'Graphic Designer | UI/UX Designer',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Featured Banner Widget
  Widget _buildFeaturedBanner(double width) {
    return Container(
      width: width,
      height: 120,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF003366), Color(0xFF001F3F)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF003366).withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ONLINE COURSE text on the left side first
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'ONLINE COURSE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Main text in the middle
          const Text(
            'Sharpen Your Skills with Professional Online Courses',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          const Spacer(),

          Align(
            alignment: Alignment.bottomLeft,
            child: TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward,
                  color: Colors.white, size: 16),
              label: const Text(
                'Join Now',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryPills() {
    return SizedBox(
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildCategoryPill(
            icon: Icons.palette,
            label: 'UI/UX Design',
            count: 28,
            color: Colors.blue[100]!,
            iconColor: Colors.blue,
            isSelected: true,
          ),
          _buildCategoryPill(
            icon: Icons.color_lens,
            label: 'Branding',
            count: 16,
            color: Colors.pink[100]!,
            iconColor: Colors.pink,
          ),
          _buildCategoryPill(
            icon: Icons.code,
            label: 'Front End',
            count: 24,
            color: Colors.green[100]!,
            iconColor: Colors.green,
          ),
        ],
      ),
    );
  }

  // Individual Category Pill
  Widget _buildCategoryPill({
    required IconData icon,
    required String label,
    required int count,
    required Color color,
    required Color iconColor,
    bool isSelected = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      width: 180,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: isSelected
            ? Border.all(color: const Color(0xFF003366), width: 2)
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 16),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  color: isSelected
                      ? const Color(0xFF003366)
                      : Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '$count watched',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Section Header
  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.more_horiz, size: 20),
          label: const Text(''),
          style: TextButton.styleFrom(
            minimumSize: Size.zero,
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
      ],
    );
  }

  // Course Grid
  Widget _buildCourseGrid(int crossAxisCount) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: crossAxisCount,
      childAspectRatio: 0.95,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: [
        _buildCourseCard(
          title:
              'Beginner\'s Guide to Becoming a Professional Front-End Developer',
          lessons: 12,
          duration: 9,
          instructor: 'Lawrence Maxwell',
          imageUrl: 'assets/firstimage.jpg',
          progressValue: 0.4,
        ),
        _buildCourseCard(
          title: 'Optimizing User Experience with The Best UI/UX Design',
          lessons: 8,
          duration: 7,
          instructor: 'Aaron Levin',
          imageUrl: 'assets/secnd image.jpg',
          progressValue: 0.6,
        ),
        _buildCourseCard(
          title: 'Branding and Refining Company\'s Image',
          lessons: 6,
          duration: 5,
          instructor: 'Patricia Feng',
          imageUrl: 'assets/thirdimage.jpg',
          progressValue: 0.2,
        ),
      ],
    );
  }

  // Individual Course Card
  Widget _buildCourseCard({
    required String title,
    required int lessons,
    required int duration,
    required String instructor,
    required String imageUrl,
    required double progressValue,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Course Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Stack(
              children: [
                Image.asset(
                  imageUrl,
                  height: 140,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                // Progress indicator
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: LinearProgressIndicator(
                    value: progressValue,
                    backgroundColor: Colors.black.withOpacity(0.3),
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                    minHeight: 5,
                  ),
                ),
                // Tag badge
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF003366),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                // Bookmark icon
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.bookmark_border,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Course Info
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 10,
                      backgroundImage: AssetImage('assets/manperson.jpeg'),
                      
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        instructor,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.access_time,
                            color: Colors.grey[600], size: 14),
                        const SizedBox(width: 4),
                        Text(
                          '$duration hrs',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 14),
                        const SizedBox(width: 4),
                        const Text(
                          '4.8',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Mentor Section
  Widget _buildMentorSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Your Mentor',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'See All',
                style: TextStyle(
                  color: Colors.deepPurple[400],
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 90,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildMentorCard(
                name: 'Padraig Safka',
                role: 'Designer',
                imageUrl: 'assets/arabicperson.jpeg',
                isFollowing: true,
              ),
              _buildMentorCard(
                name: 'Seth Westphal',
                role: 'Developer',
                imageUrl: 'assets/manperson.jpeg',
              ),
              _buildMentorCard(
                name: 'Leanora Sernal',
                role: 'UX Designer',
                imageUrl: 'assets/capboy.jpeg',
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Mentor Card
  Widget _buildMentorCard({
    required String name,
    required String role,
    required String imageUrl,
    bool isFollowing = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(12),
      width: 240,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(imageUrl),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  role,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor:
                  isFollowing ? Colors.grey[800] : Colors.deepPurple,
              backgroundColor: isFollowing ? Colors.grey[200] : Colors.white,
              side: BorderSide(
                color: isFollowing ? Colors.grey[400]! : Colors.deepPurple,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              minimumSize: const Size(0, 30),
              padding: const EdgeInsets.symmetric(horizontal: 12),
            ),
            child: Text(
              isFollowing ? 'Following' : 'Follow',
              style: TextStyle(
                fontSize: 12,
                fontWeight: isFollowing ? FontWeight.normal : FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}