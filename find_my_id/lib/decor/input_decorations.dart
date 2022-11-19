import 'package:find_my_id/decor/palette.dart';
import 'package:find_my_id/decor/text_styles.dart';
import 'package:flutter/material.dart';

InputDecoration inputDecor = InputDecoration(
  floatingLabelStyle: genTxt.copyWith(fontSize: 16),
  hintStyle: genTxt.copyWith(fontSize: 16),
  floatingLabelBehavior: FloatingLabelBehavior.always,
  counterStyle: genTxt.copyWith(fontSize: 8),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.blue,
      width: 1.0,
    ),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.red,
      width: 1.0,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: colorBoxOutline,
      width: 2.0,
    ),
  ),
);
