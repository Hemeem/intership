import 'package:flutter/material.dart';
import '../widgets/home/attendance_calender.dart';
import '../widgets/home/profile_header.dart';
import '../widgets/home/circular_progress_diagram.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/home/working_time_card.dart';
import '../widgets/curved_background.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                CurvedBackground(height: 250, color: Color(0xFF76C7C0)),
                ProfileHeader(userName: 'Hammam Abror Rofif'),
                WorkingTimeCard(
                  workingHours: '07:30 - 16:30',
                  date: 'Rab, 8 Agu 2024',
                ),
              ],
            ),
            SizedBox(height: 90),
            CircularProgressDiagram(
              totalDays: 94,
              completedDays: 70,
            ),
            AttendanceCalendar(
              attendanceData: {
                1: 'tepat_waktu',
                2: 'terlambat',
                3: 'libur',
                4: 'libur',
                5: 'tepat_waktu',
                6: 'tepat_waktu',
                7: 'tepat_waktu',
                8: 'tepat_waktu',
                9: 'tepat_waktu',
                10: 'libur',
                11: 'libur',
                12: 'tepat_waktu',
                13: 'tepat_waktu',
                14: 'tepat_waktu',
                15: 'tepat_waktu',
                16: 'tepat_waktu',
                17: 'libur',
                18: 'libur',
                19: 'tepat_waktu',
                20: 'tepat_waktu',
                21: 'tepat_waktu',
                22: 'tepat_waktu',
                23: 'tepat_waktu',
                24: 'libur',
                25: 'libur',
                26: 'tepat_waktu',
                27: 'tepat_waktu',
                28: 'tepat_waktu',
                29: 'tepat_waktu',
                30: 'tepat_waktu',
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BottomNavBar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}
