import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:login/repositories/api_repositories.dart';
import 'package:login/ui/widgets/form_field.dart';

import '../../core/constants/json_data.dart';
import '../../route/routes_name.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ApiRepositories apiRepositories = ApiRepositories();
  late Map<String, dynamic> valuesMap;

  void covertJson() {
    final Map<String, dynamic> data = json.decode(jsonData);
    final item = data['item'].firstWhere(
      (element) => element['name'] == 'Login',
      orElse: () => null,
    );

    if (item != null) {
      final authData = item['request']['body'];
      final formData = authData['formdata'];

      valuesMap = {for (var field in formData) field['key']: field['value']};
      print('${valuesMap['user_name']},${valuesMap['password']}');
    } else {
      print('Item with name "Login" not found');
    }
  }

  void submitForm() async {
    final username = emailController.text;
    final password = passwordController.text;
    if (username == valuesMap['user_name'] &&
        password == valuesMap['password']) {
      // Login successful
      Navigator.pushNamed(context, routeName.courseScreen);
      print("Login Successful!");
    } else {
      // Login failed
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid username or password")),
      );
    }
    /*if (formKey.currentState!.validate()) {

      Map<String, dynamic> credentials = {
        'email': emailController.text,
        'password': passwordController.text,
      };
      final responce = await apiRepositories.loginUser(credentials);
       print(responce);
    } else {
      print("Form is invalid. Please correct the errors.");
    }*/
  }

  @override
  void initState() {
    covertJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 32.0),
                  const Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Please login to your account',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32.0),
                  TextFieldWidget(
                    nameController: emailController,
                    hintTextMessage: 'Email',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                          .hasMatch(value)) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  TextFieldWidget(
                    nameController: passwordController,
                    hintTextMessage: 'Password',
                  ),
                  const SizedBox(height: 32.0),
                  ElevatedButton(
                    onPressed: () async {
                      submitForm();
                    },
                    child: const Text('Login'),
                  ),
                  const SizedBox(height: 8.0),
                  TextButton(
                    onPressed: () async {
                      Navigator.pushNamed(context, routeName.signupScreen);
                    },
                    child: const Text('Create a new account'),
                  ),
                  const Divider(height: 32.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
