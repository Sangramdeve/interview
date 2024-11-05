
import 'package:flutter/material.dart';
import 'package:login/repositories/api_repositories.dart';
import 'package:login/ui/widgets/form_field.dart';

import '../../route/routes_name.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ApiRepositories apiRepositories = ApiRepositories();

  void submitForm() async{
    if (formKey.currentState!.validate()) {
      // Form is valid, proceed with submission
      Map<String,dynamic> credentials  = {
        'email' : emailController.text,
        'password': passwordController.text,
      };
      final responce =
          await apiRepositories.loginUser(credentials);
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
        top: true,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
              child: Column(
            children: [
              const SizedBox(height: 16.0),
              TextFieldWidget(
                nameController: emailController,
                hintTextMessage: 'Email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFieldWidget(
                nameController: passwordController,
                hintTextMessage: 'password',
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async{
                  submitForm();
                },
                child: const Text('Login'),
              ),
              ElevatedButton(
                onPressed: () async{
                  Navigator.pushNamed(context, routeName.signupScreen);
                },
                child: const Text('Create a new account'),
              )
            ],
          )),
        ),
      ),
    );
  }
}
