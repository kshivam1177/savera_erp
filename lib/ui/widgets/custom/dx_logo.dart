import 'package:flutter/material.dart';
import 'package:savera_erp/shared/asset_provider/app_images.dart';

class DxLogo extends StatelessWidget {
  final double? height;

  const DxLogo({super.key, this.height = 22});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImages.icLogoURL, height: height);
  }
}
