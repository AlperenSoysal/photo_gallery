import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photo_gallery_app/blocs/photo_gallery_blocs/photo_gallery_bloc.dart';
import '../../../models/data_models/gallery_image_model.dart';

class PhotoGalleryHomePage extends StatelessWidget {
  const PhotoGalleryHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoGalleryBloc, AbstractPhotoGalleryState>(
      builder: (context, state) {
        if (state is PhotoGalleryLoadedState) {
          final List<GalleryImageModel> galleryImages = state.galleryImages;
          return MasonryGridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            itemCount: galleryImages.length,
            itemBuilder: (context, index) {
              return Image.network(galleryImages[index].url);
            },
          );
        } else if (state is PhotoGalleryErrorState) {
          return Text(state.error);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
