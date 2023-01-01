import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomPasswordField extends StatefulWidget {
  String? fieldName;
  TextEditingController? controller;

  CustomPasswordField({
    super.key,
    this.fieldName,
    this.controller,
  });

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

bool obscureText = false;

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: GoogleFonts.roboto(color: Colors.white),
      controller: widget.controller,
      onChanged: (value) {
        setState(() {
          value = widget.controller!.text;
        });
      },
      validator: (value) => widget.controller!.text.isEmpty
          ? "Please Enter ${widget.fieldName}"
          : null,
      obscureText: obscureText,
      decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              icon: Icon(
                obscureText == false ? Icons.visibility : Icons.visibility_off,
                color: Colors.white,
              )),
          fillColor: Colors.grey.shade900.withOpacity(0.5),
          filled: true,
          border: OutlineInputBorder(),
          hintText: '${widget.fieldName}',
          hintStyle: GoogleFonts.roboto(color: Colors.white)),
    );
  }
}
