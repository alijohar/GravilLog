import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TextFieldIconImage extends StatelessWidget {
  const TextFieldIconImage({
    super.key,
    required this.assetImage,
  });

  final String assetImage;

  @override
  Widget build(BuildContext context) {
    if (assetImage.contains('svg')) {
      return SvgPicture.asset(width: 10, height: 10, assetImage);
    }
    return Image.asset(
      assetImage,
      height: 10,
      width: 10,
    );
  }
}
