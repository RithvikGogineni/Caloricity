import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade900,
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text(
          '© 2024 Dietary Awareness | All Rights Reserved',
          style: TextStyle(color: Colors.white54, fontSize: 14),
        ),
      ),
    );
  }
}
