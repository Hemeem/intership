import 'package:flutter/material.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/curved_background.dart';
import '../widgets/logbook/filter_button.dart';
import '../widgets/logbook/logbook_card.dart';
import 'logbook_detail_screen.dart'; // Import the new detail screen

class LogbookScreen extends StatefulWidget {
  @override
  _LogbookScreenState createState() => _LogbookScreenState();
}

class _LogbookScreenState extends State<LogbookScreen> {
  int _selectedIndex = 2;
  String selectedFilter = '7 Hari';

  List<Map<String, String>> logbookData = [
    {
      'title': 'Membuat Desain UI/UX di Figma',
      'date': '09/08/2024',
      'description': 'Hari ini, saya membuat desain mockup dari UI di Figma',
      'image': 'assets/images/2208.jpg'
    },
    {
      'title': 'Melanjutkan Desain UI/UX di Figma',
      'date': '10/08/2024',
      'description': 'Hari ini, saya membuat desain mockup dari UI di Figma',
      'image': 'assets/images/2208.jpg'
    },
  ];

  List<Map<String, String>> getFilteredLogbookData() {
    if (selectedFilter == '7 Hari') {
      return logbookData;
    } else if (selectedFilter == '30 hari') {
      return logbookData;
    } else if (selectedFilter == 'Semua') {
      return logbookData;
    } else {
      return logbookData;
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showLogbookDetail(Map<String, String> logbook) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: LogbookDetailScreen(
          title: logbook['title']!,
          date: logbook['date']!,
          description: logbook['description']!,
          imageUrl: logbook['image']!,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                CurvedBackground(height: 250, color: Color(0xFF76C7C0)),
                Positioned(
                  top: 90,
                  left: 0,
                  right: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Logbook",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "September, 10",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: ['7 Hari', '30 hari', 'Semua', 'Tertentu']
                    .map((filter) => FilterButton(
                          label: filter,
                          isSelected: selectedFilter == filter,
                          onTap: () {
                            setState(() {
                              selectedFilter = filter;
                            });
                          },
                        ))
                    .toList(),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: getFilteredLogbookData()
                    .map((logbook) => GestureDetector(
                          onTap: () => _showLogbookDetail(logbook),
                          child: LogbookCard(
                            title: logbook['title']!,
                            date: logbook['date']!,
                            description: logbook['description']!,
                            imageUrl: logbook['image']!,
                          ),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addlogbook');
        },
        backgroundColor: Color(0xFF76C7C0),
        child: Icon(Icons.add),
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
