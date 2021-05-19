import 'package:crokett/core/global/helpers/ui_helper.dart';
import 'package:flutter/material.dart';

class CrokettDropDownButton extends StatefulWidget {
  final String hint;
  String? secondHint; // E.g forgotten Password
  Color? lineColour;
  VoidCallback? secondHintFunction; // E.g forgotten Password
  final List<String> listItems;
  final Function onChanged;
  bool showErrorMessage;
  final String errorMessage;

  CrokettDropDownButton({
    Key? key,
    required this.hint,
    this.secondHint,
    this.lineColour,
    this.secondHintFunction,
    required this.listItems,
    required this.onChanged,
    required this.showErrorMessage,
    required this.errorMessage,
  }) : super(key: key);

  _CrokettDropDownButtonState createState() => _CrokettDropDownButtonState();
}

class _CrokettDropDownButtonState extends State<CrokettDropDownButton> {
  String dropdownValue = '';

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
        Container(
          // width: double.infinity,
          height: UIHelper.dropDownHeight,
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(UIHelper.buttonCornerRadius)),
          child: Row(
            children: [
              DropdownButtonHideUnderline(
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton<String>(
               //     isExpanded: true,
                    hint: Text('Please Select'),
                    value: dropdownValue != '' ? dropdownValue : null,
                    //  iconSize: 24,
                    elevation: 0,
                    icon: Icon(
                      Icons.nfc_outlined,
                      color: Colors.grey[200],
                    ),
                    // style: TextStyle().copyWith(
                    //     fontSize: 16,
                    //     color: widget.lineColour),
                    underline: Container(
                      height: 2,
                      color: widget.lineColour,
                    ),
                    dropdownColor: Colors.white,
                    onChanged: (value) {
                      dropdownValue = value!;
                      widget.onChanged(value);
                    },
                    items: widget.listItems
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const Spacer(),
              Icon(Icons.arrow_downward),
              SizedBox(width: UIHelper.buttonPadding),
            ],
          ),
        ),
      ],
    );
  }
}
