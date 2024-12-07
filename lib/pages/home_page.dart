import 'package:caloricity/pages/community_page.dart';
import 'package:caloricity/pages/diet_planner_page.dart';
import 'package:caloricity/pages/games_page.dart';
import 'package:caloricity/pages/resources_page.dart';
import 'package:caloricity/utils/navigation_animation.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import '../widgets/feature_card.dart';
import '../widgets/navbar.dart';
import '../widgets/footer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 33, 33, 33),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Enhanced Banner Section
                  CenteredCaribbeanBanner(),
                  // About Section
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      'Our Features',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.orangeAccent,
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
                          onTap: () {
                            Navigator.of(context)
                                .push(createRoute(GamesPage()));
                          },
                        ),
                        FeatureCard(
                          title: 'Diet Planner',
                          description: 'Create personalized meal plans.',
                          image: 'assets/images/healthy_eating.png',
                          onTap: () {
                            Navigator.of(context)
                                .push(createRoute(DietPlannerPage()));
                          },
                        ),
                        FeatureCard(
                          title: 'Resources',
                          description:
                              'Learn about Caribbean food and nutrition.',
                          image: 'assets/images/books.png',
                          onTap: () {
                            Navigator.of(context)
                                .push(createRoute(ResourcesPage()));
                          },
                        ),
                        FeatureCard(
                          title: 'Community',
                          description:
                              'Connect with others and share your journey!',
                          image: 'assets/images/community.png',
                          onTap: () {
                            Navigator.of(context)
                                .push(createRoute(CommunityPage()));
                          },
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
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed('/games');
                          },
                          child: Text(
                            'Start Your Journey Now',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
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

// Centered Caribbean Banner
class CenteredCaribbeanBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orangeAccent, Colors.teal],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Navbar(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to\n Caloricity!',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('/about-us'); // Navigate to About Us Page
                    },
                    child: Text(
                      'Learn More',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        decoration: TextDecoration
                            .underline, // Optional: Add underline for a clickable look
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Glass Container Widget
class GlassContainer extends StatelessWidget {
  final Widget child;

  GlassContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: child,
        ),
      ),
    );
  }
}
