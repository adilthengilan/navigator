import 'package:flutter/material.dart';
import 'dart:math' as math;

class LoginPageDesk extends StatefulWidget {
  @override
  _LoginPageDeskState createState() => _LoginPageDeskState();
}

class _LoginPageDeskState extends State<LoginPageDesk>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Brand colors
  final Color primaryBlue = Color(0xFF0E3B62);
  final Color accentYellow = Color(0xFFFDCD38);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Handle button interactions
  void _handleLogin() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Logging in with ${_usernameController.text}')),
    );
  }

  void _handleGoogleLogin() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Logging in with Google')),
    );
  }

  void _handleFacebookLogin() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Logging in with Facebook')),
    );
  }

  void _handleForgotPassword() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Reset Password'),
        content: Text(
            'Password reset link will be sent to ${_usernameController.text}'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: Text('Cancel')),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Password reset email sent!')),
              );
            },
            child: Text('Send'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: primaryBlue,
      body: SingleChildScrollView(
        child: Container(
          height: screenSize.height,
          child: Stack(
            children: [
              // Background curved shape
              Positioned(
                top: screenSize.height * 0.5,
                right: 0,
                child: Container(
                  width: screenSize.width,
                  height: screenSize.height * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                ),
              ),

              // Main Content
              Center(
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Container(
                    width: screenSize.width * 0.9,
                    height: screenSize.height * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(flex: 5, child: _buildLoginForm(screenSize)),
                        Expanded(flex: 6, child: _buildIllustrationSide()),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Login form side
  Widget _buildLoginForm(Size screenSize) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLogo(fontSize: 28),
          SizedBox(height: 30),

          // Login/Sign up tabs
          Row(
            children: [
              Text('Log In',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(width: 15),
              Text('Sign Up',
                  style: TextStyle(fontSize: 20, color: Colors.grey)),
            ],
          ),
          SizedBox(height: 30),

          // Username Field
          _buildTextField(
            controller: _usernameController,
            hintText: 'Username',
            prefixIcon: Icons.person_outline,
          ),
          SizedBox(height: 20),

          // Password Field
          _buildTextField(
            controller: _passwordController,
            hintText: 'Password',
            prefixIcon: Icons.lock_outline,
            isPassword: true,
          ),
          SizedBox(height: 10),

          // Forgot Password
          GestureDetector(
            onTap: _handleForgotPassword,
            child: Text('Forgot Password?',
                style: TextStyle(color: Colors.grey, fontSize: 14)),
          ),
          SizedBox(height: 30),

          // Login Button
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: _handleLogin,
              child: Text('Log In',
                  style: TextStyle(fontSize: 16, color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryBlue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
          SizedBox(height: 10),

          // Or text
          Center(child: Text('or', style: TextStyle(color: Colors.grey))),
          SizedBox(height: 20),

          // Social Logins
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Google Login
              _buildSocialButton(
                onTap: _handleGoogleLogin,
                text: 'Google',
                icon: Image.asset(
                  'assets/google.jpg',
                  height: 20,
                  width: 20,
                ),
                backgroundColor: Colors.grey[200]!,
                textColor: Colors.black87,
              ),

              // Facebook Login
              _buildSocialButton(
                onTap: _handleFacebookLogin,
                text: 'Facebook',
                icon: Icon(Icons.facebook, color: Colors.white, size: 20),
                backgroundColor: Color(0xFF3B5998),
                textColor: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper method for text fields
  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData prefixIcon,
    bool isPassword = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
          prefixIcon: Icon(prefixIcon, color: Colors.grey),
        ),
      ),
    );
  }

  // Social login button helper
  Widget _buildSocialButton({
    required VoidCallback onTap,
    required String text,
    required Widget icon,
    required Color backgroundColor,
    required Color textColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 130,
        height: 45,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(width: 5),
            Text(text, style: TextStyle(color: textColor)),
          ],
        ),
      ),
    );
  }

  // Illustration side
  Widget _buildIllustrationSide() {
    return Container(
      decoration: BoxDecoration(
        color: primaryBlue,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Stack(
        children: [
          _buildBubbles(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildMonitorWithGraph(),
                SizedBox(height: 15),
                Text(
                  "Let's navigate your career",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                _buildIndicators(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Logo widget
  Widget _buildLogo({required double fontSize}) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2),
        children: [
          TextSpan(text: 'navigat', style: TextStyle(color: Colors.black)),
          TextSpan(text: 'rr', style: TextStyle(color: accentYellow)),
        ],
      ),
    );
  }

  // Floating Bubbles animation
  Widget _buildBubbles() {
    return Stack(
      children: [
        for (int i = 0; i < 5; i++)
          Positioned(
            top: 40.0 + (i * 30),
            right: i % 2 == 0 ? 40.0 : 100.0,
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(
                      0,
                      5 *
                          math.sin(
                              (_animationController.value * 2 * math.pi) + i)),
                  child: Container(
                    width: 20 + (i * 3),
                    height: 20 + (i * 3),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      shape: BoxShape.circle,
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }

  // Simple monitor with graph
  Widget _buildMonitorWithGraph() {
    return Container(
      width: 220,
      height: 150,
      decoration: BoxDecoration(
        color: Color(0xFF2C3E50),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Graph header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 40,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.grey[600],
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      Row(
                        children: [
                          for (int i = 0; i < 3; i++) ...[
                            if (i > 0) SizedBox(width: 5),
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: Colors.grey[600],
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Graph
                  Expanded(
                    child: CustomPaint(
                      size: Size(double.infinity, 100),
                      painter: GraphPainter(accentColor: accentYellow),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Monitor stand
          Container(
            width: 50,
            height: 10,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Bottom Indicators
  Widget _buildIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(width: 30, height: 3, color: accentYellow),
        SizedBox(width: 5),
        Container(width: 15, height: 3, color: Colors.white.withOpacity(0.5)),
        SizedBox(width: 5),
        Container(width: 15, height: 3, color: Colors.white.withOpacity(0.5)),
      ],
    );
  }
}

// Simple graph painter
class GraphPainter extends CustomPainter {
  final Color accentColor;

  GraphPainter({required this.accentColor});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = accentColor.withOpacity(0.9)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final fillPaint = Paint()
      ..shader = LinearGradient(
        colors: [
          accentColor.withOpacity(0.5),
          accentColor.withOpacity(0.0),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    final path = Path();
    final fillPath = Path();

    // Starting point
    path.moveTo(0, size.height * 0.8);
    fillPath.moveTo(0, size.height);
    fillPath.lineTo(0, size.height * 0.8);

    // Graph points
    path.cubicTo(size.width * 0.2, size.height * 0.6, size.width * 0.3,
        size.height * 0.7, size.width * 0.4, size.height * 0.4);

    path.cubicTo(size.width * 0.5, size.height * 0.2, size.width * 0.7,
        size.height * 0.35, size.width * 0.8, size.height * 0.3);

    path.cubicTo(size.width * 0.9, size.height * 0.25, size.width * 0.95,
        size.height * 0.4, size.width, size.height * 0.5);

    // Copy the path for fill
    fillPath.addPath(path, Offset.zero);
    fillPath.lineTo(size.width, size.height);
    fillPath.lineTo(0, size.height);
    fillPath.close();

    // Draw the fill and then the line
    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
