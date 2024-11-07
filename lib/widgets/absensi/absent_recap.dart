import 'package:flutter/material.dart';

class AbsenCard extends StatelessWidget {
  final String date;
  final String inTime;
  final String outTime;
  final bool isLate;

  const AbsenCard({
    required this.date,
    required this.inTime,
    required this.outTime,
    required this.isLate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            date,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildAttendanceTimeCard('JAM MASUK', inTime, isLate),
              _buildAttendanceTimeCard('JAM KELUAR', outTime, false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAttendanceTimeCard(String label, String time, bool isLate) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        SizedBox(height: 8),
        Text(
          time,
          style: TextStyle(
            color: isLate ? Colors.red : Colors.green,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
