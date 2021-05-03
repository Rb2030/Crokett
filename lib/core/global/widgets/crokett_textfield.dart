import 'package:flutter/material.dart';

import 'package:crokett/core/global/colors/custom_colours.dart';
import 'package:crokett/core/global/helpers/ui_helper.dart';

class CrokettTextField extends StatefulWidget {
  final String hint;
  String? secondHint;
  VoidCallback? secondHintFunction; // E.g forgotten Password
  final TextEditingController controller;
  final Function onChanged;
  final TextInputType inputType;
  final bool obscureText;
  final Function validator;
  bool showErrorMessage;
  final String errorMessage;

  CrokettTextField({
    Key? key,
    required this.hint,
    this.secondHint,
    this.secondHintFunction,
    required this.controller,
    required this.onChanged,
    required this.inputType,
    required this.obscureText,
    required this.validator,
    required this.showErrorMessage,
    required this.errorMessage,
  }) : super(key: key);

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
        Row(children: [
          SizedBox(width: 4),
          Text(
            widget.hint,
            style:
                TextStyle().copyWith(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          TextButton(
              onPressed: widget.secondHintFunction,
              child: Text(widget.secondHint ?? '',
                  style: TextStyle().copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      decoration: TextDecoration.underline))),
          SizedBox(width: 4)
        ]),
        const SizedBox(height: 4),
        Stack(
          children: [
            Positioned(
              child: Container(
                child: TextFormField(
                  obscureText: widget.obscureText,
                  validator: (text) {
                    widget.validator(text);
                    setState(() {});
                  },
                  onChanged: (text) {
                    widget.onChanged(text);
                    setState(() {
                    });
                  },
                  keyboardType: widget.inputType,
                  controller: widget.controller,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(14, 16, 10, 16),
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
                    ),
                    hintText: widget.hint,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Visibility(
                visible: widget.showErrorMessage,
                child: Column(
                  children: [
                    SizedBox(height: 75),
                    Container(
                      width: 300,
                      color: CustomColours.crokettYellow,
                      child: Padding(
                          padding: EdgeInsets.all(UIHelper.buttonPadding),
                          child: Text(widget.errorMessage,
                              style: TextStyle().copyWith(fontSize: 14))),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
