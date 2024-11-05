import 'dart:io';

abstract class BaseApiServices {
  Future<dynamic> getApi(String uri);

  Future<dynamic> postApi(String uri, data, File? imageFile);

}
