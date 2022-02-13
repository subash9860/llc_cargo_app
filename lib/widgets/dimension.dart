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
      height: 77,
      width: width,
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.0),
        side: const BorderSide(color: Colors.black, width: 3.2),
      )),
      child: Column(
        children: [
          Text(
            topName,
            softWrap: true,
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w600,
              overflow: TextOverflow.fade,
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: hints.toString(),
              border: InputBorder.none,
              icon: const Padding(
                padding: EdgeInsets.only(left: 28, top: 25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
