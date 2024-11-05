import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login/ui/widgets/form_field.dart';

import '../../../repositories/api_repositories.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confPasswordController = TextEditingController();
  final ApiRepositories apiRepositories = ApiRepositories();
  final ImagePicker picker = ImagePicker();
  File? image;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void submitForm() async{
    if (formKey.currentState!.validate()) {
      Map<String, dynamic> credentials = {
        'name': nameController.text,
        'email': emailController.text,
        'mobile': mobileController,
        'password': passwordController,
        'comf_password': mobileController,
      };
      final responce =
          await apiRepositories.registerUser(credentials,image);
      print(responce);
    } else {
      print("Form is invalid. Please correct the errors.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 32.0),
                const Text(
                  'Create Your Account',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'Please fill in the details below',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32.0),
                TextFieldWidget(
                  nameController: nameController,
                  hintTextMessage: 'Full Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Full name is required';
                    }
                    return null;
                  },
                ),
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
                  nameController: mobileController,
                  hintTextMessage: 'Mobile Number',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Mobile number is required';
                    } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                      return 'Enter a valid 10-digit mobile number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFieldWidget(
                  nameController: passwordController,
                  hintTextMessage: 'Password',

                  validator: (value) {
                    if (value == null || value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                TextFieldWidget(
                  nameController: confPasswordController,
                  hintTextMessage: 'Confirm Password',
                  validator: (value) {
                    if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: () async {
                    final pickedFile =
                    await picker.pickImage(source: ImageSource.gallery);
                    if (pickedFile != null) {
                      setState(() {
                        image = File(pickedFile.path);
                      });
                    }
                  },
                  child: const Text('Pick Image'),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    submitForm();
                  },
                  child: const Text('Register'),
                ),
                const SizedBox(height: 32.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
