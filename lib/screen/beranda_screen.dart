import 'package:flutter/material.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/beranda/profile_header.dart';
import '../widgets/beranda/working_time_card.dart';
import '../widgets/beranda/attendance_card.dart';
import '../widgets/curved_background.dart';

class BerandaScreen extends StatefulWidget {
  @override
  _BerandaScreenState createState() => _BerandaScreenState();
}

class _BerandaScreenState extends State<BerandaScreen> {
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
            Container(
              transform: Matrix4.translationValues(0.0, -60.0, 0.0),
              padding: EdgeInsets.all(28),
              child: Column(
                children: [
                  SizedBox(height: 160),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Kehadiran',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/absensi');
                        },
                        child: Text(
                          'Lihat Semua',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  AttendanceCard(
                    date: '10 Agustus 2024',
                    inTime: '07:25:39 WIB',
                    outTime: '16:31:00 WIB',
                    isLate: false,
                  ),
                  AttendanceCard(
                    date: '9 Agustus 2024',
                    inTime: '07:35:11 WIB',
                    outTime: '16:34:00 WIB',
                    isLate: true,
                  ),
                ],
              ),
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
