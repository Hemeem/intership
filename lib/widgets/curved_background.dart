import 'package:flutter/material.dart';

class CurvedBackground extends StatelessWidget {
  final double height;
  final Color color;

  CurvedBackground({required this.height, required this.color});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurvedBackgroundClipper(),
      child: Container(
        height: height,
        color: color,
      ),
    );
  }
}

class CurvedBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstControlPoint = Offset(size.width / 2, size.height);
    var firstEndPoint = Offset(size.width, size.height - 50);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
