import 'package:flutter/material.dart';
import '../widgets/feature_card.dart';
import '../widgets/navbar.dart';
import '../widgets/footer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Navbar(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Banner Section
                  CaribbeanBanner(),
                  // About Section
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'What is Dietary Awareness?',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Our mission is to educate and inspire healthy eating habits through engaging games, '
                          'interactive tools, and culturally rich resources tailored to the Caribbean lifestyle.',
                          style: TextStyle(fontSize: 18, color: Colors.white70),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/images/tropical_fruits.png',
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Features Section
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Explore Our Features',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FeatureCard(
                          title: 'Games',
                          description:
                              'Play fun calorie games like Higher or Lower!',
                          image: 'assets/images/game_controller.png',
                        ),
                        FeatureCard(
                          title: 'Diet Planner',
                          description: 'Create personalized meal plans.',
                          image: 'assets/images/healthy_eating.png',
                        ),
                        FeatureCard(
                          title: 'Resources',
                          description:
                              'Learn about Caribbean food and nutrition.',
                          image: 'assets/images/books.png',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  // Call to Action
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Start Your Journey'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Footer(),
        ],
      ),
    );
  }
}

// Caribbean Banner Section
class CaribbeanBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.teal.shade700, Colors.orange.shade600],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 20,
            top: 50,
            child: Text(
              'Welcome to\nDietary Awareness!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/tropical_dance.png',
                height: 250,
                width: 250,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
