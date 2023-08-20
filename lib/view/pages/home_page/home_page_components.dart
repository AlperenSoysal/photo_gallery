import 'package:flutter/material.dart';
import 'package:photo_gallery_app/view/theme/app_colors.dart';
import 'package:photo_gallery_app/view/theme/font_styles.dart';

import '../../../models/data_models/gallery_image_model.dart';

class GalleryImageComponent extends StatefulWidget {
  final GalleryImageModel image;
  const GalleryImageComponent({Key? key, required this.image}) : super(key: key);

  @override
  State<GalleryImageComponent> createState() => _GalleryImageComponentState();
}

class _GalleryImageComponentState extends State<GalleryImageComponent> {
  bool showId = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              showId = !showId;
            });
          },
          child: Image.network(widget.image.url),
        ),
        if (showId)
          Positioned.fill(
            left: CSizes.doublePadding,
            bottom: CSizes.doublePadding,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.white,
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Text(widget.image.id),
              ),
            ),
          ),
      ],
    );
  }
}
