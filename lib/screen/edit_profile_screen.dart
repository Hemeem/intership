import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // Text controllers to capture input values
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nimController = TextEditingController();
  final TextEditingController schoolController = TextEditingController();
  final TextEditingController majorController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize with existing user data if available
    nameController.text = 'Hammam Abror Rofif';
    emailController.text = 'hammam@google.com';
    nimController.text = '4342201054';
    schoolController.text = 'Polibatam';
    majorController.text = 'TRPL';
  }

  @override
  void dispose() {
    // Dispose the controllers when not needed
    nameController.dispose();
    emailController.dispose();
    nimController.dispose();
    schoolController.dispose();
    majorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: Color(0xFF76C7C0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildTextField(label: 'Full Name', controller: nameController),
            _buildTextField(label: 'Email', controller: emailController),
            _buildTextField(label: 'NIM / NIS', controller: nimController),
            _buildTextField(
                label: 'Asal Sekolah / Univ', controller: schoolController),
            _buildTextField(label: 'Jurusan', controller: majorController),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF76C7C0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              child: Text(
                'Save Changes',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      {required String label, required TextEditingController controller}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }
}
