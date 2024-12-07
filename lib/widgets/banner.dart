import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://via.placeholder.com/1920x600?text=Banner+Image'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome to Caloricity!',
            style: TextStyle(
                fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 10),
          Text(
            'Learn about nutrition and healthy living in an engaging way!',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {}, // Link to your games page
            child: Text('Play Now'),
          ),
        ],
      ),
    );
  }
}
