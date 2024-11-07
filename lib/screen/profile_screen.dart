import 'package:flutter/material.dart';
import 'package:internship/widgets/curved_background.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/profile/edit_profile_button.dart';
import '../widgets/profile/profile_item.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Add navigation logic here if needed
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CurvedBackground(height: 250, color: Color(0xFF76C7C0)),
                    Positioned(
                      top: 140,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage:
                                AssetImage('assets/images/profile_picture.png'),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Hammam Abror Rofif',
                            style: TextStyle(
                              color: Color(0xFF76C7C0),
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 80),
                ProfileItem(
                  icon: Icons.cake,
                  label: 'Tempat, Tanggal Lahir',
                  value: 'Batam, 15 Agustus 2004',
                ),
                ProfileItem(
                  icon: Icons.email,
                  label: 'Email',
                  value: 'hammam@google.com',
                ),
                ProfileItem(
                  icon: Icons.calculate,
                  label: 'NIM / NIS',
                  value: '4342201054',
                ),
                ProfileItem(
                  icon: Icons.school,
                  label: 'Asal Sekolah / Univ',
                  value: 'Polibatam',
                ),
                ProfileItem(
                  icon: Icons.book,
                  label: 'Jurusan',
                  value: 'TRPL',
                ),
                ProfileItem(
                  icon: Icons.visibility,
                  label: 'Password',
                  value: '********',
                  isPassword: true,
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          EditProfileButton(
            onPressed: () {
              Navigator.pushNamed(context, '/editprofile');
            },
          ),
        ],
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
