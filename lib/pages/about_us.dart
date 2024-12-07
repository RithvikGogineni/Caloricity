import 'package:flutter/material.dart';
import '../widgets/navbar.dart'; // Assuming Navbar is in a separate file

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Navbar at the Top

          // Gradient-Filled Body
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.teal.shade400,
                    Colors.orange.shade300,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Navbar(),
                      // Title Section
                      SizedBox(height: 30),
                      Text(
                        'About Us',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Discover who we are and our mission to inspire healthier eating habits with Caribbean flair!',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 30),

                      // About Us Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/images/about_us.png', // Add your about us image here
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 30),

                      // Who We Are Section
                      Text(
                        'Who We Are',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Caloricity is a vibrant platform designed to educate and inspire healthy eating habits, while embracing the rich flavors and culture of the Caribbean. We believe in combining fun, interactive tools with nutritional awareness to make mindful eating engaging for everyone.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 30),

                      // Mission Section
                      Text(
                        'Our Mission',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'At Caloricity, our mission is to bridge the gap between nutritional awareness and fun learning experiences. From interactive games to personalized diet plans, we’re here to make your journey toward healthy eating both enjoyable and impactful.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 30),

                      // Why Choose Us Section
                      Text(
                        'Why Choose Us?',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'We are committed to:\n\n'
                        '• Making nutritional education accessible and fun\n'
                        '• Celebrating the diversity of Caribbean cuisine\n'
                        '• Empowering individuals with tools for mindful eating',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
