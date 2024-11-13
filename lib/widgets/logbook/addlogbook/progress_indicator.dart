import 'package:flutter/material.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  final int currentStep;

  ProgressIndicatorWidget({required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(3, (index) {
        return Column(
          children: [
            CircleAvatar(
              radius: 12,
              backgroundColor:
                  index + 1 == currentStep ? Color(0xFF76C7C0) : Colors.grey,
              child: Text((index + 1).toString(),
                  style: TextStyle(color: Colors.white)),
            ),
            Text(
              ['Isi Kegiatan', 'Deskripsi Kegiatan', 'Dokumentasi'][index],
              style: TextStyle(fontSize: 12),
            ),
          ],
        );
      }),
    );
  }
}
