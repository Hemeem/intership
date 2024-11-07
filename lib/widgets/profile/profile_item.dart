import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool isPassword;

  const ProfileItem({
    required this.icon,
    required this.label,
    required this.value,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Icon(icon, color: Color(0xFF76C7C0)),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    Text(
                      value,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight:
                            isPassword ? FontWeight.normal : FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              if (isPassword)
                IconButton(
                  icon: Icon(Icons.refresh, color: Colors.grey),
                  onPressed: () {
                    // Handle password change action here
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
