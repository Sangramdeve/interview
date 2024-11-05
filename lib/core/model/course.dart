class CourseResponse {
  final String response;
  final String message;
  final List<Course> data;

  CourseResponse({
    required this.response,
    required this.message,
    required this.data,
  });

  factory CourseResponse.fromJson(Map<String, dynamic> json) {
    return CourseResponse(
      response: json['response'] as String,
      message: json['message'] as String,
      data: (json['data'] as List)
          .map((item) => Course.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Course {
  final int id;
  final String courseName;
  final int? categoryId;
  final String? categoryName;
  final String courseCode;
  final String courseDuration;
  final String courseFee;
  final String courseValidity;
  final int status;
  final String uploadPhoto;
  final String description;
  final String oneDayCourse;
  final String? certificate;

  Course({
    required this.id,
    required this.courseName,
    this.categoryId,
    this.categoryName,
    required this.courseCode,
    required this.courseDuration,
    required this.courseFee,
    required this.courseValidity,
    required this.status,
    required this.uploadPhoto,
    required this.description,
    required this.oneDayCourse,
    this.certificate,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'] as int,
      courseName: json['course_name'] as String,
      categoryId: json['category_id'] as int?,
      categoryName: json['category_name'] as String?,
      courseCode: json['course_code'] as String,
      courseDuration: json['course_duration'] as String,
      courseFee: json['course_fee'] as String,
      courseValidity: json['course_validity'] as String,
      status: json['status'] as int,
      uploadPhoto: json['upload_photo'] as String,
      description: json['description'] as String,
      oneDayCourse: json['one_day_course'] as String,
      certificate: json['certificate'] as String?,
    );
  }
}
