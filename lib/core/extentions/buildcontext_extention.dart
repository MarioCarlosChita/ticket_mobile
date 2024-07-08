import 'package:flutter/material.dart';

extension BuildContextEx on BuildContext {
  Size? get devizeSize => size;
  double get width => devizeSize!.width;
  double get height => devizeSize!.height;
}
