import 'package:flutter/material.dart';


class CustomText extends StatelessWidget {
  String txt;
  double? size;
  FontWeight? fontWeight;
  Color? color;
  int? maxLines;
  bool? underLine, througLine, overFlowdesable;

  CustomText(
      {Key? key,
        required this.txt,
        this.fontWeight,
        this.size,
        this.color,
        this.underLine,
        this.througLine,
        this.overFlowdesable,
        this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxLines,
      txt,
      style: TextStyle(
          fontSize: size,
          fontWeight: fontWeight,
          fontFamily: 'OpenSans',
          color: color ,
          decoration: underLine == true
              ? TextDecoration.underline
              : througLine == true
              ? TextDecoration.lineThrough
              : TextDecoration.none),
      overflow: overFlowdesable == true ? null : TextOverflow.ellipsis,
    );
  }
}
