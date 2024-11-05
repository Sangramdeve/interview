import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:login/core/constants/api_url.dart';
import 'package:login/core/services/api_services/api_services.dart';

import '../core/model/course.dart';

class ApiRepositories {
  final ApiServices apiServices = ApiServices();

  Future<String> registerUser(Map<String, dynamic> credentials,
      File? imageFile) async {
    final response =
    await apiServices.postApi(ApiUrl.registration, credentials, imageFile);
    return response;
  }

  Future<String> loginUser(Map<String, dynamic> credentials) async {
    try {
      final response = await http.post(
        Uri.parse(ApiUrl.login),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(credentials),
      );

      if (response.statusCode == 200) {
        return response.body;
      } else {
        print('Error: ${response.statusCode}');
        return 'Failed to login: ${response.statusCode}, ${response.body}';
      }
    } catch (e) {
      print('Exception: $e');
      return 'Error: $e';
    }
  }

  Future<CourseResponse> listData() async {
    try{
      final responce = await apiServices.getApi(ApiUrl.list);
      CourseResponse courseResponse = CourseResponse.fromJson(responce);
      return courseResponse;
    }catch(e){
      print(e);
      rethrow;
    }
  }
}


