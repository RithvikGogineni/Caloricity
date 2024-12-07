import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Colors.orange,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Dietary Awareness',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Row(
            children: [
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/'),
                child: Text('Home', style: TextStyle(color: Colors.black)),
              ),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/games'),
                child: Text('Games', style: TextStyle(color: Colors.black)),
              ),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/diet-planner'),
                child:
                    Text('Diet Planner', style: TextStyle(color: Colors.black)),
              ),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/resources'),
                child: Text('Resources', style: TextStyle(color: Colors.black)),
              ),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/community'),
                child: Text('Community', style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
