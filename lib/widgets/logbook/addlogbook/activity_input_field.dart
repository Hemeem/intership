import 'package:flutter/material.dart';

class ActivityInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Kegiatan"),
        TextField(
          maxLines: 3,
          decoration: InputDecoration(
            hintText: "Jelaskan kegiatan hari ini...",
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
