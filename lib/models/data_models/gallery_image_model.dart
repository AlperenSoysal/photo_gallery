class GalleryImageModel {
  final String id;
  final String url;

  const GalleryImageModel({
    required this.id,
    required this.url,
  });

  Map<String, dynamic> toJSON() => {
        'id': id,
        'url': url,
      };

  factory GalleryImageModel.fromJSON(Map<String, dynamic> json) {
    return GalleryImageModel(
      id: json['id'],
      url: json['url'],
    );
  }
}
