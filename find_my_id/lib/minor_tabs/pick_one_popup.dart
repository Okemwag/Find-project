import 'package:find_my_id/constants/my_enums.dart';
import 'package:find_my_id/constants/string_resources.dart';
import 'package:find_my_id/decor/palette.dart';
import 'package:find_my_id/utils/utils.dart';
import 'package:flutter/material.dart';

import '../decor/text_styles.dart';

class PickOnePopUp extends StatefulWidget {
  final String popupString;
  const PickOnePopUp({
    Key? key,
    required this.popupString,
  }) : super(key: key);

  @override
  State<PickOnePopUp> createState() => _PickOnePopUpState();
}

class _PickOnePopUpState extends State<PickOnePopUp> {
  CardCategory? _selectedCard = CardCategory.school;
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
          child: Material(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.popupString,
                  softWrap: true,
                  style: genTxt.copyWith(
                    fontSize: 15,
                    color: colorPrimary,
                  ),
                ),
                ListTile(
                  title: Text(
                    schoolIDCategory,
                    style: genTxt,
                  ),
                  leading: Radio<CardCategory>(
                    value: CardCategory.school,
                    groupValue: _selectedCard,
                    onChanged: (CardCategory? value) {
                      setState(() {
                        _selectedCard = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text(
                    nationalIDCategory,
                    style: genTxt,
                  ),
                  leading: Radio<CardCategory>(
                    value: CardCategory.national,
                    groupValue: _selectedCard,
                    onChanged: (CardCategory? value) {
                      setState(() {
                        _selectedCard = value;
                      });
                    },
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
                        child: Text(
                          "CANCEL",
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: TextButton(
                        onPressed: () {
                          popupFunctions[pickOneFn]!(context);
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
      ),
    );
  }
}
