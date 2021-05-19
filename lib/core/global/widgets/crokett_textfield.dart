import 'package:crokett/core/global/widgets/triangle_shape.dart';
import 'package:flutter/material.dart';

import 'package:crokett/core/global/colors/custom_colours.dart';
import 'package:crokett/core/global/helpers/ui_helper.dart';

class CrokettTextField extends StatefulWidget {
  final String hint;
  String? secondHint;  // E.g forgotten Password
  VoidCallback? secondHintFunction; // E.g forgotten Password
  final TextEditingController controller;
  final Function onChanged;
  final TextInputType inputType;
  final bool obscureText;
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
                  onChanged: (text) {
                    widget.onChanged(text);
                 //   setState(() {});
                  },
                  keyboardType: widget.inputType,
                  controller: widget.controller,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(14, 16, 10, 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(UIHelper.buttonCornerRadius),
                      borderSide: BorderSide(style: BorderStyle.none),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(UIHelper.buttonCornerRadius),
                      borderSide: const BorderSide(style: BorderStyle.none),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(UIHelper.buttonCornerRadius),
                      borderSide: const BorderSide(style: BorderStyle.none),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(UIHelper.buttonCornerRadius),
                      borderSide: const BorderSide(style: BorderStyle.none),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(UIHelper.buttonCornerRadius),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 28), // Height of text field
                    Row(children: [
                      SizedBox(width: 15),
                      CustomPaint(
                          size: Size(30, 45),
                          painter: TriangleShape(color: CustomColours.crokettYellow)),
                      const Spacer()
                    ]),
                    Container(
                      width: 300,
                      decoration: BoxDecoration(
                          color: CustomColours.crokettYellow,
                          border: Border.all(
                            color: CustomColours.crokettYellow,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
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
