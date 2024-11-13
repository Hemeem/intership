import 'package:flutter/material.dart';
import '../widgets/absen/absent_recap.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/absen/time_card.dart';
import '../widgets/curved_background.dart';

class AbsensiScreen extends StatefulWidget {
  @override
  _AbsensiScreenState createState() => _AbsensiScreenState();
}

class _AbsensiScreenState extends State<AbsensiScreen> {
  int _selectedIndex = 1;

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
                CurvedBackground(height: 260, color: Color(0xFF76C7C0)),

                // TimeCard
                Positioned(
                  top: 200,
                  left: 20,
                  right: 20,
                  child: TimeCard(),
                ),
              ],
            ),
            Container(
              transform: Matrix4.translationValues(0.0, -40.0, 0.0),
              padding: EdgeInsets.all(28),
              child: Column(
                children: [
                  SizedBox(height: 150),
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
                          Navigator.pushNamed(context, '/beranda');
                        },
                        child: Text(
                          'Lihat Semua',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  AbsenCard(
                    date: '03 Agustus 2024',
                    inTime: '07:25:16 WIB',
                    outTime: '16:34:00 WIB',
                    isLate: false,
                  ),
                  AbsenCard(
                    date: '04 Agustus 2024',
                    inTime: '07:27:09 WIB',
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
