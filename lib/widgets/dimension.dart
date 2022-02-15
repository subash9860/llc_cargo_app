// import 'dart:html';

import 'package:flutter/material.dart';

class DimensionForGoods extends StatelessWidget {
  final double hints;
  final String topName;
  final double width;
  const DimensionForGoods(
      {Key? key,
      required this.hints,
      required this.topName,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74,
      width: width,
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.0),
        side: const BorderSide(color: Colors.black, width: 3),
      )),
      child: Column(
        children: [
          Text(
            topName,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: hints.toString(),
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }
}
