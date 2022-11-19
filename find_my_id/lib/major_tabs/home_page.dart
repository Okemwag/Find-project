import 'package:find_my_id/constants/string_resources.dart';
import 'package:find_my_id/decor/palette.dart';
import 'package:find_my_id/decor/text_styles.dart';
import 'package:find_my_id/minor_tabs/report_lost_found_card.dart';
import 'package:find_my_id/routes/routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: RichText(
            text: TextSpan(
              text: "F",
              style: appBarText.copyWith(color: colorLogoBlack),
              children: [
                TextSpan(
                  text: 'i',
                  style: appBarText.copyWith(color: colorLogoOrange),
                ),
                TextSpan(
                  text: 'N',
                  style: appBarText.copyWith(color: colorLogoBlack),
                ),
                TextSpan(
                  text: 'd',
                  style: appBarText.copyWith(color: colorLogoOrange),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReportLostFoundCard(lostIllustration),
                    ReportLostFoundCard(foundIllustration),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: colorWhiteBackground,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          searchHeading,
                          style: genTxt.copyWith(
                            fontSize: 15,
                            color: colorPrimaryVariant,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, RouteManager.searchPage);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: colorBoxOutline),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 4, right: 2, top: 3, bottom: 3),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.search_rounded,
                                    color: colorBoxOutline,
                                  ),
                                  Flexible(
                                    child: Text(
                                      searchBarText,
                                      overflow: TextOverflow.ellipsis,
                                      style: genTxt.copyWith(
                                        color: colorPrimaryVariant,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
