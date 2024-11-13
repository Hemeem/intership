import 'package:flutter/material.dart';

class DateAndTitleInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Tanggal"),
        SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: "09/10/2024",
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        SizedBox(height: 16),
        Text("Judul Kegiatan"),
        SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: "Masukkan judul kegiatan",
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
