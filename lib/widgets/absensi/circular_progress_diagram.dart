import 'package:flutter/material.dart';

class CircularProgressDiagram extends StatelessWidget {
  final double totalDays;
  final double completedDays;

  CircularProgressDiagram({
    required this.totalDays,
    required this.completedDays,
  });

  @override
  Widget build(BuildContext context) {
    double remainingDays = totalDays - completedDays;
    double progress = completedDays / totalDays;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 110,
              width: 110,
              child: CircularProgressIndicator(
                value: progress,
                strokeWidth: 10,
                backgroundColor: Colors.white
                    .withOpacity(0.3), // Lightened white for background
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.white, // White color for progress
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${remainingDays.toInt()}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // White text color
                  ),
                ),
                Text(
                  'Hari\nTersisa',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white
                        .withOpacity(0.8), // Slightly transparent white
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          '${completedDays.toInt()} dari ${totalDays.toInt()} hari telah diselesaikan',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white.withOpacity(0.8), // White for additional text
          ),
        ),
      ],
    );
  }
}
