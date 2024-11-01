import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextfield extends StatefulWidget {
  final Widget? suffix;
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final bool obscureText;
  final Icon icon;
  
  const MyTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.obscureText,
    required this.icon,
    this.suffix,
  });

  @override
  State<MyTextfield> createState() => _MyTextfieldState();
}

class _MyTextfieldState extends State<MyTextfield> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          suffixIcon: widget.suffix,
          prefixIcon: widget.icon,
          prefixIconColor: Theme.of(context).colorScheme.inversePrimary,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.inversePrimary)
          ),
          focusColor: Theme.of(context).colorScheme.tertiary,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.inversePrimary)
          ),
          hintText: widget.hintText,
          labelText: widget.labelText,
          labelStyle: GoogleFonts.poppins(
            color: Theme.of(context).colorScheme.inversePrimary
          ),
          hintStyle: GoogleFonts.poppins(
            color: Theme.of(context).colorScheme.inversePrimary
          ),
        ),
      ),
    );
  }
}