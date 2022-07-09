import 'package:flutter/material.dart';

class BgImage extends StatelessWidget {
  const BgImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/a.jpg",fit: BoxFit.cover,color: Colors.black.withOpacity(0.4),
      colorBlendMode: BlendMode.darken,);
  }
}