import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final Color lightGrey = const Color(0xFFE8E8E8);
  final TextEditingController controller; // Use specific type instead of dynamic
  final String hintText;
  final bool obscureText;
  final FocusNode? focusNode; // Add focusNode parameter

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.focusNode, // Accept focusNode parameter
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        focusNode: focusNode, 
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(15.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 196, 196, 196),
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
          fillColor: lightGrey,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[400]),
          contentPadding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
        ),
      ),
    );
  }
}