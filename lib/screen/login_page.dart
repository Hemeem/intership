import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: WavePainter(),
            ),
          ),
          // Content
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage(
                        'assets/images/logo.png'), // Ganti dengan path logo Anda
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(height: 20),

                  // Judul
                  Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),

                  // Input Email
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Input Password
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 10),

                  // Lupa Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Aksi untuk lupa password
                      },
                      child: Text('Lupa Password?'),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Tombol Sign In
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/beranda');
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text('Sign In'),
                  ),
                  SizedBox(height: 20),

                  // Daftar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Belum Memiliki Akun? '),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: Text(
                          'Daftar Disini',
                          style: TextStyle(
                            color: Color(0xFF80C1C8),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Color(0xFF80C1C8);

    Path path = Path();
    path.lineTo(0, size.height * 0.3);

    // Create wave effect
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.4,
        size.width * 0.5, size.height * 0.3);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.2, size.width, size.height * 0.3);

    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
