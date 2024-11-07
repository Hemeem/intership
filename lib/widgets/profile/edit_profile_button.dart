import 'package:flutter/material.dart';

class EditProfileButton extends StatelessWidget {
  final VoidCallback onPressed;

  const EditProfileButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 60,
      right: 20,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(Icons.edit, color: Colors.blueGrey, size: 30),
      ),
    );
  }
}
