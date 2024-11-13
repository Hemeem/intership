import 'package:flutter/material.dart';

class AttendanceCalendar extends StatelessWidget {
  final Map<int, String> attendanceData;

  AttendanceCalendar({required this.attendanceData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12.0),
          margin: EdgeInsets.symmetric(horizontal: 28.0, vertical: 26.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              // Month and Year header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "September 2024",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(Icons.arrow_back, size: 16),
                      Icon(Icons.arrow_forward, size: 16),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),

              // Day labels
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: ["Sen", "Sel", "Rab", "Kam", "Jum", "Sab", "Min"]
                    .map((day) => Text(day, style: TextStyle(fontSize: 12)))
                    .toList(),
              ),
              SizedBox(height: 8),

              // Calendar grid
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  mainAxisSpacing: 3, 
                  crossAxisSpacing: 4,
                  childAspectRatio: 1, 
                ),
                itemCount: 35, // Assuming 5 weeks
                itemBuilder: (context, index) {
                  int day = index - 2; // Adjust start day if needed
                  String status = attendanceData[day] ?? 'libur';
                  Color color;

                  if (status == 'tepat_waktu') {
                    color = Colors.green;
                  } else if (status == 'terlambat') {
                    color = Colors.orange;
                  } else {
                    color = Colors.red;
                  }

                  return day > 0 && day <= 30
                      ? Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            "$day",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        )
                      : Container(); // Empty space for non-date cells
                },
              ),
              SizedBox(height: 8),

              // Legend
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildLegendItem("Terlambat", Colors.orange),
                  _buildLegendItem("Tepat Waktu", Colors.green),
                  _buildLegendItem("Libur", Colors.red),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 7,
          height: 7,
          color: color,
        ),
        SizedBox(width: 4),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
