import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MultiSelectChip extends StatefulWidget {
  List<String> genders;

  Function(String) onSelectionChanged;
  MultiSelectChip(this.genders, {Key? key, required this.onSelectionChanged})
      : super(key: key);
  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}
class _MultiSelectChipState extends State<MultiSelectChip> {
  String selectedChoice = "";
  // String test;
  _buildChoiceList() {
    List<Widget> choices = [];
    widget.genders.forEach((item) {
      choices.add(Container(
        width: 100,
        padding: const EdgeInsets.all(10.0),
        child: ChoiceChip(
          selectedColor: Color.fromRGBO(0, 191, 225, 0.5),
          label: Container(
            //width:180,
            decoration: const BoxDecoration(
              border: Border(),
            ),
            child: Center(
              child: Text(item),
            ),
          ),
          labelPadding: const EdgeInsets.all(0),
          selected: selectedChoice == item,
          onSelected: (selected) {
            setState(() {
              selectedChoice = item;
              //print(item);
              //onSaved: (value) => item =test;

              widget.onSelectionChanged(selectedChoice);
            });
          },
          backgroundColor: Color.fromRGBO(238, 255, 249, 2),
          labelStyle: const TextStyle(
            color: Color.fromRGBO(66, 78, 98, 2),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(
                width: 1,
                color: Colors.white,
                // borderRadius: BorderRadius.circular(10),
              )),
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList());
}}





