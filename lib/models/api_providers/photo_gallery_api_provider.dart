import 'package:dio/dio.dart';

import '../generic_models/generic_api_providers/generic_photo_gallery_api_provider.dart';

class PhotoGalleryApiProvider implements GenericPhotoGalleryApiProvider {
  @override
  Future<List<Map<String, dynamic>>?> fetchPhotoGallery() async {
    Dio dio = Dio();
    var response = await dio.get('https://api.thecatapi.com/v1/images/search?limit=80&mime_types=&order=Random&size=small&page=3&sub_id=demo-ce06ee');

    if (response.statusCode == 200) {
      final List<Map<String, dynamic>> responseBody = List<Map<String, dynamic>>.from(response.data);
      return responseBody;
    }
    return null;
  }
}
