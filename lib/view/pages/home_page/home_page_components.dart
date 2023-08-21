import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_gallery_app/view/main_components.dart';
import 'package:photo_gallery_app/view/theme/app_colors.dart';
import 'package:photo_gallery_app/view/theme/font_styles.dart';

import '../../../blocs/photo_gallery_blocs/photo_gallery_bloc.dart';
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
          child: FutureBuilder<void>(
            future: precacheImage(NetworkImage(widget.image.url), context),
            builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                final double randomHeight = Random().nextInt(125) + 75;
                return ShimmerContainer(width: (MediaQuery.of(context).size.width - 8) / 3, height: randomHeight);
              } else if (snapshot.hasError) {
                return ErrorOccurredWidget(
                  reload: () => context.read<PhotoGalleryBloc>().add(FetchPhotoGalleryEvent()),
                );
              } else {
                return Image.network(widget.image.url);
              }
            },
          ),
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
