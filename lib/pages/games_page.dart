import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';

class GamesPage extends StatefulWidget {
  @override
  _GamesPageState createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  List<dynamic> foods = [];
  Map<String, dynamic> currentFood1 = {};
  Map<String, dynamic> currentFood2 = {};
  String selectedFood = '';
  int score = 0;
  int lives = 3;
  int personalBest = 0;

  @override
  void initState() {
    super.initState();
    loadFoods();
  }

  Future<void> loadFoods() async {
    try {
      final String response = await rootBundle.loadString('assets/foods.json');
      final data = json.decode(response);
      setState(() {
        foods = data['foods'];
        if (foods.isNotEmpty) generateNewPair();
      });
    } catch (e) {
      print('Error loading JSON: $e');
    }
  }

  void generateNewPair() {
    final random = Random();
    final int index1 = random.nextInt(foods.length);
    int index2 = random.nextInt(foods.length);

    while (index1 == index2) {
      index2 = random.nextInt(foods.length);
    }

    setState(() {
      currentFood1 = foods[index1];
      currentFood2 = foods[index2];
      selectedFood = ''; // Reset selection
    });
  }

  void checkAnswer(String choice) {
    final bool isCorrect = (choice == 'food1' &&
            currentFood1['calories'] > currentFood2['calories']) ||
        (choice == 'food2' &&
            currentFood2['calories'] > currentFood1['calories']);

    if (isCorrect) {
      setState(() {
        score++;
        if (score > personalBest) personalBest = score;
      });
      showFeedbackDialog('Correct!', true);
    } else {
      setState(() {
        lives--;
      });

      if (lives == 0) {
        showGameOverDialog();
      } else {
        showFeedbackDialog('Wrong!', false);
      }
    }
  }

  void showFeedbackDialog(String message, bool isCorrect) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GlassDialog(
        title: message,
        content:
            'The correct calories are:\n${currentFood1['name']}: ${currentFood1['calories']} Cal\n${currentFood2['name']}: ${currentFood2['calories']} Cal',
        isCorrect: isCorrect,
        buttonText: 'Next',
        onPressed: () {
          Navigator.pop(context);
          generateNewPair();
        },
      ),
    );
  }

  void showGameOverDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => GlassDialog(
        title: 'Game Over',
        content: 'Your final score: $score\nWould you like to restart?',
        isCorrect: false,
        buttonText: 'Restart',
        onPressed: () {
          Navigator.pop(context);
          resetGame();
        },
      ),
    );
  }

  void resetGame() {
    setState(() {
      score = 0;
      lives = 3;
    });
    generateNewPair();
  }

  @override
  Widget build(BuildContext context) {
    if (foods.isEmpty || currentFood1.isEmpty || currentFood2.isEmpty) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          // Split-Screen Layout
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap:
                      selectedFood.isEmpty ? () => checkAnswer('food1') : null,
                  child: FoodImage(
                    food: currentFood1,
                    isSelected: selectedFood == 'food1',
                  ),
                ),
              ),
              Container(
                width: 2,
                color: Colors.white.withOpacity(0.3),
              ),
              Expanded(
                child: GestureDetector(
                  onTap:
                      selectedFood.isEmpty ? () => checkAnswer('food2') : null,
                  child: FoodImage(
                    food: currentFood2,
                    isSelected: selectedFood == 'food2',
                  ),
                ),
              ),
            ],
          ),
          // Glassmorphic Panel at Top
          Positioned(
            top: 30,
            left: 20,
            right: 20,
            child: GlassPanel(
              score: score,
              lives: lives,
              personalBest: personalBest,
            ),
          ),
        ],
      ),
    );
  }
}

class FoodImage extends StatelessWidget {
  final Map<String, dynamic> food;
  final bool isSelected;

  FoodImage({required this.food, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(food['image']),
              fit: BoxFit.cover,
            ),
          ),
        ),
        if (isSelected)
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
      ],
    );
  }
}

class GlassPanel extends StatelessWidget {
  final int score;
  final int lives;
  final int personalBest;

  GlassPanel(
      {required this.score, required this.lives, required this.personalBest});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          color: Colors.grey[800]!.withOpacity(0.6),
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Score: $score\nPersonal Best: $personalBest',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: List.generate(
                  3,
                  (index) => Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Image.asset(
                      'assets/images/coconut.png',
                      height: 30,
                      color: index < lives
                          ? null
                          : Colors.grey, // Grayscale for lost lives
                      colorBlendMode: BlendMode.saturation,
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
}

class GlassDialog extends StatelessWidget {
  final String title;
  final String content;
  final bool isCorrect;
  final String buttonText;
  final VoidCallback onPressed;

  GlassDialog({
    required this.title,
    required this.content,
    required this.isCorrect,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: Colors.grey[800]!.withOpacity(0.6),
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: isCorrect ? Colors.green : Colors.red,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  content,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    buttonText,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
