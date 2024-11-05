import 'package:flutter/material.dart';
import 'package:login/repositories/api_repositories.dart';
import 'package:login/ui/widgets/form_field.dart';

import '../../route/routes_name.dart';
import '../widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ApiRepositories apiRepositories = ApiRepositories();

  void submitForm() async {
    if (formKey.currentState!.validate()) {
      // Form is valid, proceed with submission
      Map<String, dynamic> credentials = {
        'email': emailController.text,
        'password': passwordController.text,
      };
      final responce = await apiRepositories.loginUser(credentials);
      print(responce);
    } else {
      print("Form is invalid. Please correct the errors.");
    }
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
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
                  CustomButtons(
                    text: 'Jump to List Screen',
                    onTap: () {
                      Navigator.pushNamed(context, routeName.courseScreen);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
