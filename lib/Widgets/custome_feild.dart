import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomField extends StatefulWidget {
  String? fieldName;
  TextEditingController? controller;
  CustomField({super.key, this.fieldName, this.controller});

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
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
      decoration: InputDecoration(
          fillColor: Colors.grey.shade900.withOpacity(0.5),
          filled: true,
          border: OutlineInputBorder(),
          hintText: '${widget.fieldName}',
          hintStyle: GoogleFonts.roboto(color: Colors.white)),
    );
  }
}
