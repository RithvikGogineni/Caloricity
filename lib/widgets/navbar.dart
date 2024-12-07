import 'package:flutter/material.dart';
import 'dart:ui';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Row(
        children: [
          // Logo Section with Rounded Rectangle
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            width: 60,
            height: 60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'assets/images/logo.png', // Replace with your logo asset
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 20), // Space between logo and navigation
          // Navigation Section with Gradient Background
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Colors.orange.shade200.withOpacity(0.5),
                    Colors.teal.shade400.withOpacity(0.5),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _NavbarButton(
                    label: 'Home',
                    onTap: () {
                      Navigator.of(context).pushNamed('/');
                    },
                  ),
                  _NavbarButton(
                    label: 'Games',
                    onTap: () {
                      Navigator.of(context).pushNamed('/games');
                    },
                  ),
                  _NavbarButton(
                    label: 'Diet Planner',
                    onTap: () {
                      Navigator.of(context).pushNamed('/diet-planner');
                    },
                  ),
                  _NavbarButton(
                    label: 'Resources',
                    onTap: () {
                      Navigator.of(context).pushNamed('/resources');
                    },
                  ),
                  _NavbarButton(
                    label: 'Community',
                    onTap: () {
                      Navigator.of(context).pushNamed('/community');
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Navbar Button with Hover Effect and Darker Gradient
class _NavbarButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  _NavbarButton({required this.label, required this.onTap});

  @override
  __NavbarButtonState createState() => __NavbarButtonState();
}

class __NavbarButtonState extends State<_NavbarButton> {
  bool isHovered = false;

  Color _darkerShade(Color color, double amount) {
    return Color.fromARGB(
      color.alpha,
      (color.red * (1 - amount)).toInt(),
      (color.green * (1 - amount)).toInt(),
      (color.blue * (1 - amount)).toInt(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Gradient Colors
    final gradientStart = Colors.orange.shade200;
    final gradientEnd = Colors.teal.shade400;

    // Darker Gradient for Hover
    final darkerStart = _darkerShade(gradientStart, 0.3);
    final darkerEnd = _darkerShade(gradientEnd, 0.3);

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: isHovered
                ? LinearGradient(
                    colors: [darkerStart, darkerEnd],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : null, // No background when not hovered
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              color: isHovered ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
