import 'package:flutter/material.dart';
import 'package:savera_erp/ui/widgets/custom/text/dx_text.dart';

class FullScreenImageView extends StatefulWidget {
  final String image;
  final String? title;

  const FullScreenImageView({
    super.key,
    required this.image,
    this.title,
  });

  @override
  State<FullScreenImageView> createState() => _FullScreenImageViewState();
}

class _FullScreenImageViewState extends State<FullScreenImageView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: widget.title != null
          ? AppBar(
              // iconTheme: IconThemeData(color: Colors.black),
              title: DxTextWhite(
                "${widget.title} Images",
                fontSize: 18,
              ),
              centerTitle: false,
            )
          : null,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          decoration: const BoxDecoration(color: Colors.white),
          child: Image.network(
            widget.image,
            fit: BoxFit.contain,
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }

  BoxDecoration getParentImageWidget(imagePath, showBottomRound) {
    return BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(showBottomRound ? 100.0 : 0),
        bottomLeft: Radius.circular(showBottomRound ? 100.0 : 0),
      ),
      image: DecorationImage(
        image: NetworkImage(imagePath),
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
