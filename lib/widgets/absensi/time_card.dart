import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeCard extends StatefulWidget {
  @override
  _TimeCardState createState() => _TimeCardState();
}

class _TimeCardState extends State<TimeCard> {
  String _currentTime = '';
  String _currentDate = '';
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _currentTime = _formatCurrentTime();
    _currentDate = _formatCurrentDate();
    _startTimer();
  }

  // Format the current time as HH:mm:ss
  String _formatCurrentTime() {
    return DateFormat('HH:mm:ss').format(DateTime.now());
  }

  // Format the current date as 'EEEE, d MMM yyyy'
  String _formatCurrentDate() {
    return DateFormat('EEEE, d MMM yyyy', 'id_ID').format(DateTime.now());
  }

  // Update the time every second
  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        _currentTime = _formatCurrentTime();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior:
          Clip.none, // Untuk memungkinkan card keluar dari batas stack
      children: [
        // Card untuk menampilkan waktu bekerja dan tombol absen
        Container(
          margin: EdgeInsets.only(
              top: 10), // Memberi margin agar tidak tertutup oleh card di atas
          padding: EdgeInsets.all(18),
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
              SizedBox(height: 12),
              Text(
                _currentTime,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Atur jarak antara tombol
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        'Absen Masuk',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        'Absen Pulang',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // Card untuk menampilkan hari dan tanggal
        Positioned(
          left: 20, // Atur posisi horizontal
          right: 20,
          top: -60, // Menggeser ke atas
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Text(
              _currentDate, // Menampilkan tanggal
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
