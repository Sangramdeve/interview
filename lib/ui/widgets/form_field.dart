import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.nameController,
    required this.hintTextMessage,
    this.validator,
    this.prefixIcon,
  });

  final TextEditingController nameController;
  final String hintTextMessage;
  final String? Function(String?)? validator;
  final Widget? prefixIcon; // Optional prefix icon

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nameController,
      decoration: InputDecoration(
        hintText: hintTextMessage,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 16.0,
        ),
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(
            color: Colors.blue,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(
            color: Colors.blueAccent,
            width: 2.0,
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
            vertical: 15.0, horizontal: 20.0),
      ),
      style: const TextStyle(
        fontSize: 18,
        color: Colors.black,
      ),
      validator: validator,
    );
  }
}
