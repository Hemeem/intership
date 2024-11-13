import 'package:flutter/material.dart';

class DocumentationInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Dokumentasi"),
        SizedBox(height: 8),
        ElevatedButton.icon(
          onPressed: () {
            // Tambahkan logika untuk memilih foto
          },
          icon: Icon(Icons.photo),
          label: Text("Choose photo"),
        ),
        SizedBox(height: 4),
        Text(
          "Format file yang diperbolehkan: PNG, JPG, JPEG",
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}
