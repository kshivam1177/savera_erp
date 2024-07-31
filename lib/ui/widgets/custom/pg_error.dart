import 'package:flutter/material.dart';
import 'package:savera_erp/shared/asset_provider/app_images.dart';
import 'package:savera_erp/ui/theme/app_colors.dart';
import 'package:savera_erp/ui/widgets/custom/text/dx_text.dart';

class ErrorPage extends StatelessWidget {
  final VoidCallback onPressed;
  final String pageTitle;
  final String error;
  final bool showAppBar;

  const ErrorPage({
    super.key,
    required this.onPressed,
    required this.error,
    this.pageTitle = "Error",
    this.showAppBar = false,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: showAppBar
          ? AppBar(
              centerTitle: false,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () => Navigator.pop(context),
              ),
              title: DxText(
                pageTitle,
                textColor: Colors.white,
                fontSize: 20,
                bold: true,
              ),
            )
          : AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
      body: Container(
        height: size.height,
        color: Colors.white,
        padding: const EdgeInsets.only(bottom: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                AppImages.errorAccess,
                height: 260,
              ),
            ),
            // Image.asset("resources/images/empty.png",height: 200,),
            const SizedBox(
              height: 10,
            ),
            DxText(
              error,
              bold: true,
              maxLines: 5,
              fontSize: 18,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            MaterialButton(
              onPressed: onPressed,
              color: AppColors.primary,
              child: const DxText(
                "Retry",
                textColor: Colors.white,
                bold: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
