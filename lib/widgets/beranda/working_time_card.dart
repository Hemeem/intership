import 'package:flutter/material.dart';

class WorkingTimeCard extends StatelessWidget {
  final String workingHours;
  final String date;

  const WorkingTimeCard({required this.workingHours, required this.date});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 210,
      left: 30,
      right: 30,
      child: Transform.translate(
        offset: Offset(0.0, -20.0), // Geser ke atas
        child: Container(
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Waktu Bekerja',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    date,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                workingHours,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
