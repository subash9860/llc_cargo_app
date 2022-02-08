import 'package:flutter/material.dart';

class ButtonCustomized extends StatelessWidget {
  final Function buttonpress;
  final String butttonText;
  final Color buttonColor;
  final Color textColor;
  final double height;
  final double width;

  const ButtonCustomized({
    Key? key,
    required this.butttonText,
    required this.buttonpress,
    required this.buttonColor,
    required this.textColor,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () {
          buttonpress();
        },
        child: Text(
          butttonText,
          style: TextStyle(fontSize: 22, color: textColor),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
              side: BorderSide(color: textColor, width: 0),
            ),
          ),
        ),
      ),
    );
  }
}
