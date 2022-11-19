import 'package:find_my_id/constants/string_resources.dart';
import 'package:find_my_id/routes/routes.dart';
import 'package:flutter/material.dart';

void createSnackBar({required BuildContext context, required String text}) {
  final snackBar = SnackBar(
    content: Text(text),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

const Map<String, Function(BuildContext context)> popupFunctions = {
  confirmFn: confirmSomething,
  pickOneFn: pickNationalOrSchool,
};

void confirmSomething(BuildContext context) {
  //TODO: business logic
  Navigator.pop(context);
}

void pickNationalOrSchool(BuildContext context) {
  //TODO: business logic
  Navigator.popAndPushNamed(context, RouteManager.camScanPage);
}
