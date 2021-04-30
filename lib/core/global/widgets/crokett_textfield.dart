import 'package:flutter/material.dart';

class CrokettTextField extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final TextInputType inputType;
  final bool obscureText;
  final Function validator;
  final Function onChanged;

  CrokettTextField(
      {required this.hint,
      required this.controller,
      required this.onChanged,
      required this.inputType,
      required this.obscureText,
      required this.validator});

  _CrokettTextFieldState createState() => _CrokettTextFieldState();
}

class _CrokettTextFieldState extends State<CrokettTextField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [SizedBox(width: 4),Text(widget.hint, style: TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.w500),), const Spacer()]),
        const SizedBox(height: 4),
        TextFormField(
          obscureText: widget.obscureText,
          validator: (text) {
            widget.validator(text);
            setState(() {});
          },
          onChanged: (text) {
            widget.onChanged(text);
            setState(() {
              // if (!widget.validator(text) || text.length == 0) {
              //   currentColor = widget.errorColor;
              // } else {
              //   currentColor = widget.baseColor;
              // }
            });
          },
          keyboardType: widget.inputType,
          controller: widget.controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(14, 17, 10, 17),
            // floatingLabelBehavior: FloatingLabelBehavior.always,
            // labelText: widget.hint,
            // labelStyle: TextStyle(color: Colors.black),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(style: BorderStyle.none),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(style: BorderStyle.none),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(style: BorderStyle.none),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(style: BorderStyle.none),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: const BorderSide(style: BorderStyle.none),
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintStyle: TextStyle(
              color: Colors.grey,
              // fontFamily: "OpenSans",
              // fontWeight: FontWeight.w300,
            ),
            hintText: widget.hint,
          ),
        ),
      ],
    );
  }
}
