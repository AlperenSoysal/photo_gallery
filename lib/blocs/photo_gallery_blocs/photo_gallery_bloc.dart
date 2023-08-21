import 'package:flutter_bloc/flutter_bloc.dart';
import '../../globals/api_implementations.dart';
import '../../models/data_models/gallery_image_model.dart';

abstract class AbstractPhotoGalleryState {
  const AbstractPhotoGalleryState();
}

class PhotoGalleryLoadingState implements AbstractPhotoGalleryState {
  const PhotoGalleryLoadingState();
}

class PhotoGalleryLoadedState implements AbstractPhotoGalleryState {
  final List<GalleryImageModel> galleryImages;

  PhotoGalleryLoadedState({
    required this.galleryImages,
  });
}

class PhotoGalleryErrorState implements AbstractPhotoGalleryState {
  final String error;
  PhotoGalleryErrorState(this.error);
}

abstract class AbstractPhotoGalleryEvent {}

class FetchPhotoGalleryEvent implements AbstractPhotoGalleryEvent {
  FetchPhotoGalleryEvent();
}

class PhotoGalleryBloc extends Bloc<AbstractPhotoGalleryEvent, AbstractPhotoGalleryState> {
  PhotoGalleryBloc() : super(const PhotoGalleryLoadingState()) {
    on<FetchPhotoGalleryEvent>(_onFetch);
  }

  Future<void> _onFetch(FetchPhotoGalleryEvent event, Emitter<AbstractPhotoGalleryState> emitter) async {
    try {
      emitter(
        const PhotoGalleryLoadingState(),
      );
      final List<Map<String, dynamic>>? postsJson = await photoGalleryApiProvider.fetchPhotoGallery();
      if (postsJson == null) {
        emitter(PhotoGalleryErrorState("Some error from api"));
      } else {
        List<GalleryImageModel> galleryImages = postsJson.map((postAsJson) => GalleryImageModel.fromJSON(postAsJson)).toList();
        emitter(
          PhotoGalleryLoadedState(
            galleryImages: galleryImages,
          ),
        );
      }
    } catch (e) {
      emitter(PhotoGalleryErrorState(e.toString()));
    }
  }
}
