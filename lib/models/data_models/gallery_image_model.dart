import 'package:photo_gallery_app/models/generic_models/generic_data_model.dart';

class GalleryImageModel implements GenericModel {
  final String id;
  final String url;

  GalleryImageModel({
    required this.id,
    required this.url,
  });

  @override
  Map<String, dynamic> toJSON() => {
        'id': id,
        'url': url,
      };

  @override
  factory GalleryImageModel.fromJSON(Map<String, dynamic> json) {
    return GalleryImageModel(
      id: json['id'],
      url: json['url'],
    );
  }

  @override
  DateTime lastUpdated = DateTime.now();
}
