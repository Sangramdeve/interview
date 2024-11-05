
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:login/core/services/api_services/base_api_services.dart';

class ApiServices implements BaseApiServices {
  @override
  Future getApi(String uri) async {
    try {
      final response = await http.get(Uri.parse(uri));
      final jsonData = jsonDecode(response.body);
      return jsonData;
    } catch (e) {
      print('getApi$e');
    }
  }

  @override
  Future postApi(String uri, data, File? imageFile) async {
    final request = http.MultipartRequest('POST', Uri.parse(uri));

    data.forEach((key, value) {
      request.fields[key] = value.toString();
    });

    if (imageFile != null) {
      request.files.add(await http.MultipartFile.fromPath(
        'image',
        imageFile.path,
      ));
    }

    final streamedResponse = await request.send();

    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to register user: ${response.statusCode}');
    }
  }
}
