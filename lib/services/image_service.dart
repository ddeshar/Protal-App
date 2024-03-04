
import 'package:dio/dio.dart';
import 'package:protal_app/Model/image_response.dart';

class ImageService {

  final dio = Dio();

  @override
  Future<ImageResponse> getImage({required String offset}) async {
    try {
      final response = await dio.get('https://api.slingacademy.com/v1/sample-data/photos?offset=$offset&limit=20');
      return ImageResponse.fromJson(response.data);
    } catch (error) {
      throw Exception('Failed to fetch user data: $error');
    }
  }
}
