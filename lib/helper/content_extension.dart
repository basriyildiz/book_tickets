import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double dynamicHeight(double val) => MediaQuery.of(this).size.height * val;
  double dynamicWidth(double val) => MediaQuery.of(this).size.width * val;
}

extension PaddingExtension on BuildContext {
  double get sValue => dynamicHeight(0.01);
  double get mValue => dynamicHeight(0.02);
  double get lValue => dynamicHeight(0.03);
  double get xlValue => dynamicHeight(0.05);
}
