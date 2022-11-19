import 'package:find_my_id/constants/string_resources.dart';
import 'package:find_my_id/decor/palette.dart';
import 'package:find_my_id/decor/text_styles.dart';
import 'package:find_my_id/routes/routes.dart';
import 'package:flutter/material.dart';

class ReportLostFoundCard extends StatelessWidget {
  final String illustrationFile;
  ReportLostFoundCard(this.illustrationFile, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (illustrationFile == lostIllustration) {
          //Navigator.pushNamed(context, RouteManager.pickOnePopup,arguments: pickOneFn);
        } else {
          // Navigator.pushNamed(context, RouteManager.confirmPopup, arguments: confirmFn);
          Navigator.pushNamed(context, RouteManager.camScanPage);
        }
      },
      child: Card(
        elevation: 1,
        shadowColor: shadowColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 8),
          child: Column(
            children: [
              Image.asset(
                'assets/images/' + illustrationFile,
                height: 100,
                width: 100,
              ),
              Text(
                (illustrationFile == lostIllustration)
                    ? reportLostString
                    : reportFoundString,
                style: genTxt.copyWith(
                    fontWeight: FontWeight.bold, color: colorPrimaryVariant),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
