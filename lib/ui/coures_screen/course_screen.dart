import 'package:flutter/material.dart';
import 'package:login/core/model/course.dart';
import 'package:login/repositories/api_repositories.dart';

class CourseScreen extends StatelessWidget {
   CourseScreen({super.key});
final ApiRepositories apiRepositories = ApiRepositories();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Course Details'),
      ),
      body: FutureBuilder<CourseResponse>(
          future: apiRepositories.listData(),
          builder: (context,snapshot){
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              final courses = snapshot.data!.data;
              return ListView.builder(
                itemCount: courses.length,
                itemBuilder: (context,index){
                  final course = courses[index];
                  return ListTile(
                    leading:  Image.network(
                      course.uploadPhoto,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/placeholder.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                    title: Text(course.courseName),
                    subtitle: Text('Duration: ${course.courseDuration} days, Fee: ${course.courseFee}'),
                  );
                },
              );
            }
            return Text('No data found');
          }),
    );
  }
}
