import 'package:cached_network_image/cached_network_image.dart';
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
          child: CachedNetworkImage(
            imageUrl: widget.image.url,
            errorWidget: (context, _, error) {
              return ErrorOccurredWidget(
                reload: () => context.read<PhotoGalleryBloc>().add(FetchPhotoGalleryEvent()),
              );
            },
            placeholder: (context, url) {
              return ShimmerContainer(width: (MediaQuery.of(context).size.width - 8) / 3, height: 125);
            },
          ),
        ),
        Positioned.fill(
          left: CSizes.doublePadding,
          bottom: CSizes.doublePadding,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: ImageIdComponent(
              id: widget.image.id,
              showId: showId,
            ),
          ),
        ),
      ],
    );
  }
}

class ImageIdComponent extends StatelessWidget {
  final String id;
  final bool showId;

  const ImageIdComponent({super.key, required this.id, required this.showId});

  @override
  Widget build(BuildContext context) {
    if (showId) {
      return Container(
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
        child: Text(id),
      );
    } else {
      return const SizedBox();
    }
  }
}
