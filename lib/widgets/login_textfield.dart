import 'package:flutter/material.dart';

class LoginTextField extends StatefulWidget {
  final String textName;
  final Icon iconName;
  const LoginTextField(
      {Key? key, required this.textName, required this.iconName})
      : super(key: key);

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  TextEditingController _controller = TextEditingController();
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
        controller: _controller,
        decoration: InputDecoration(
          hintText: widget.textName,
          border: InputBorder.none,
          icon: Padding(
            padding: const EdgeInsets.only(left: 5, top: 2),
            child: widget.iconName,
          ),
        ),
      ),
    );
  }
}
