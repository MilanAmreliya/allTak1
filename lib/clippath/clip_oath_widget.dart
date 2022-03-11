import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClipPatheCustom extends StatefulWidget {
  @override
  _ClipPatheCustomState createState() => _ClipPatheCustomState();
}

class _ClipPatheCustomState extends State<ClipPatheCustom> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ClipPath(
          clipper: MyCustomClipClass(),
          child: Container(
            width: Get.width,
            height: 400,
            color: Colors.blueAccent,
          ),
        ),
      ),
    );
  }
}

class MyCustomClipClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 400;
    final double _yScaling = size.height / 896;
    path.lineTo(389.5 * _xScaling, 328.282 * _yScaling);
    path.cubicTo(
      389.5 * _xScaling,
      328.282 * _yScaling,
      68.1733 * _xScaling,
      209.531 * _yScaling,
      68.1733 * _xScaling,
      209.531 * _yScaling,
    );
    path.cubicTo(
      68.1733 * _xScaling,
      209.531 * _yScaling,
      67.7759 * _xScaling,
      209.384 * _yScaling,
      67.7759 * _xScaling,
      209.384 * _yScaling,
    );
    path.cubicTo(
      67.7759 * _xScaling,
      209.384 * _yScaling,
      67.5658 * _xScaling,
      209.752 * _yScaling,
      67.5658 * _xScaling,
      209.752 * _yScaling,
    );
    path.cubicTo(
      67.5658 * _xScaling,
      209.752 * _yScaling,
      0.5 * _xScaling,
      327.117 * _yScaling,
      0.5 * _xScaling,
      327.117 * _yScaling,
    );
    path.cubicTo(
      0.5 * _xScaling,
      327.117 * _yScaling,
      0.5 * _xScaling,
      5.0316 * _yScaling,
      0.5 * _xScaling,
      5.0316 * _yScaling,
    );
    path.cubicTo(
      0.5 * _xScaling,
      5.0316 * _yScaling,
      0.5 * _xScaling,
      1.39606 * _yScaling,
      0.5 * _xScaling,
      1.39606 * _yScaling,
    );
    path.cubicTo(
      0.5 * _xScaling,
      1.39606 * _yScaling,
      48.9137 * _xScaling,
      60.3174 * _yScaling,
      48.9137 * _xScaling,
      60.3174 * _yScaling,
    );
    path.cubicTo(
      48.9137 * _xScaling,
      60.3174 * _yScaling,
      49.0134 * _xScaling,
      60.4388 * _yScaling,
      49.0134 * _xScaling,
      60.4388 * _yScaling,
    );
    path.cubicTo(
      49.0134 * _xScaling,
      60.4388 * _yScaling,
      49.1646 * _xScaling,
      60.4813 * _yScaling,
      49.1646 * _xScaling,
      60.4813 * _yScaling,
    );
    path.cubicTo(
      49.1646 * _xScaling,
      60.4813 * _yScaling,
      326.565 * _xScaling,
      138.481 * _yScaling,
      326.565 * _xScaling,
      138.481 * _yScaling,
    );
    path.cubicTo(
      326.565 * _xScaling,
      138.481 * _yScaling,
      326.976 * _xScaling,
      138.597 * _yScaling,
      326.976 * _xScaling,
      138.597 * _yScaling,
    );
    path.cubicTo(
      326.976 * _xScaling,
      138.597 * _yScaling,
      327.154 * _xScaling,
      138.208 * _yScaling,
      327.154 * _xScaling,
      138.208 * _yScaling,
    );
    path.cubicTo(
      327.154 * _xScaling,
      138.208 * _yScaling,
      389.5 * _xScaling,
      2.28924 * _yScaling,
      389.5 * _xScaling,
      2.28924 * _yScaling,
    );
    path.cubicTo(
      389.5 * _xScaling,
      2.28924 * _yScaling,
      389.5 * _xScaling,
      328.282 * _yScaling,
      389.5 * _xScaling,
      328.282 * _yScaling,
    );
    path.cubicTo(
      389.5 * _xScaling,
      328.282 * _yScaling,
      389.5 * _xScaling,
      328.282 * _yScaling,
      389.5 * _xScaling,
      328.282 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}
