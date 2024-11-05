import 'package:flutter/material.dart';

class CustomButtons extends StatelessWidget {

  final String text;
  final VoidCallback onTap;

  const CustomButtons({

    super.key,
    required this.text,
    required this.onTap,
  });



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextButton(
        style: TextButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: Colors.grey.shade300),
            )
        ),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center content horizontally
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18, // Decreased text size
              ),
            ),
          ],
        ),
      ),
    );
  }
}