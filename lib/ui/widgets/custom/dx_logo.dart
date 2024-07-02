import 'package:flutter/material.dart';
import 'package:savera_erp/app_utilities/app_images.dart';

class DxLogo extends StatelessWidget {
  final double? height;

  const DxLogo({super.key, this.height = 22});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImages.icLogoURL, height: height);
  }
}
