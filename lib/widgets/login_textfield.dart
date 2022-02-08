import 'package:flutter/material.dart';

class LginTextField extends StatelessWidget {
  final String textName;
  final Icon iconName;
  const LginTextField(
      {Key? key, required this.textName, required this.iconName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.072,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.0),
        side: const BorderSide(color: Colors.black, width: 2),
      )),
      child: TextField(
        decoration: InputDecoration(
          hintText: textName,
          border: InputBorder.none,
          icon: Padding(
            padding: const EdgeInsets.only(left: 5, top: 2),
            child: iconName,
          ),
        ),
      ),
    );
  }
}
