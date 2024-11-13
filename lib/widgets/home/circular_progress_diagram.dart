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

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 130,
                width: 130,
                child: CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 10,
                  backgroundColor: Colors.black.withOpacity(0.2),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0xFF80C1C8),
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
                      color: Color(0xFF80C1C8),
                    ),
                  ),
                  Text(
                    'Hari\nTersisa',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF80C1C8).withOpacity(0.8),
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
              color: Color(0xFF80C1C8).withOpacity(0.8),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
