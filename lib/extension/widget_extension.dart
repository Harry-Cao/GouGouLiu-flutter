import 'package:flutter/material.dart';

extension PaddingExtension on Widget {
  Widget padding(
      {double left = 0, double right = 0, double top = 0, double bottom = 0}) {
    return Container(
      padding:
          EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
      child: this,
    );
  }

  Widget margin(
      {double left = 0, double right = 0, double top = 0, double bottom = 0}) {
    return Container(
      margin:
          EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
      child: this,
    );
  }

  Widget size({double? width, double? height}) {
    return SizedBox(
      width: width,
      height: height,
      child: this,
    );
  }
}

extension ThemeExtension on Widget {
  Widget theme({required ThemeData data}) {
    return Theme(data: data, child: this);
  }
}

extension ScrollExtension on Widget {
  Widget scrollable() {
    return SingleChildScrollView(
      child: this,
    );
  }
}
