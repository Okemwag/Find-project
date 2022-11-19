import 'package:find_my_id/constants/string_resources.dart';
import 'package:find_my_id/decor/palette.dart';
import 'package:find_my_id/utils/utils.dart';
import 'package:flutter/material.dart';

import '../decor/text_styles.dart';

class ConfirmPopUp extends StatelessWidget {
  final String popupString;
  const ConfirmPopUp({
    Key? key,
    required this.popupString,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10.0),
          height: 180,
          constraints: BoxConstraints(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Material(
                child: Text(
                  popupString,
                  softWrap: true,
                  style: genTxt.copyWith(
                    fontSize: 15,
                    color: colorPrimary,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("CANCEL"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: TextButton(
                      onPressed: () {
                        popupFunctions[confirmFn]!(context);
                      },
                      child: Text("OK"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
