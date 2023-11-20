import 'package:flutter/material.dart';

class myInput extends StatefulWidget {
  final controller;
  final String hint;

  const myInput({
    required this.controller,
    required this.hint,
  });
  @override
  State<myInput> createState() => _myInputstate();
}

class _myInputstate extends State<myInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent)),
        fillColor: Colors.white,
        filled: true,
        hintText: widget.hint,
        hintStyle: TextStyle(color: Colors.grey[500]),
      ),
    );
  }
}
