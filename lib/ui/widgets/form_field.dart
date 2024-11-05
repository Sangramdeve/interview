import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.nameController,
    required this.hintTextMessage,
    this.validator,
  });

  final TextEditingController nameController;
  final String hintTextMessage;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nameController,
      decoration: InputDecoration(
        hintText: hintTextMessage,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.blue,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.blueAccent,
            width: 2.0,
          ),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      style: const TextStyle(
        fontSize: 18,
        color: Colors.black,
      ),
      validator: validator,
    );
  }
}
