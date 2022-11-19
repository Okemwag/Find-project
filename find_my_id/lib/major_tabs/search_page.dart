import 'package:find_my_id/constants/string_resources.dart';
import 'package:find_my_id/decor/input_decorations.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController searchController;
  var whichCardList = [
    "Card",
  ];
  var whichSchoolList = [
    "Institution",
  ];
  var whichGateList = [
    "Pick Location",
  ];

  late String whichCard, whichSchool, whichGate;

  bool isWhichCardPressed = false;
  bool isWhichSchoolPressed = false;
  bool isWhichGatePressed = false;

  @override
  void initState() {
    searchController = TextEditingController();
    whichCard = whichCardList[0];
    whichSchool = whichSchoolList[0];
    whichGate = whichGateList[0];
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(searchAppBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: inputDecor.copyWith(hintText: searchBarText),
              onChanged: (val) {
                //TODO: display live changes
              },
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                runSpacing: 10,
                spacing: 10,
                children: [
                  ActionChip(
                    label: Text(resetChipLabel),
                    onPressed: () {
                      searchController.clear();
                    },
                    avatar: Icon(
                      Icons.refresh,
                    ),
                  ),
                  ActionChip(
                    label: Row(
                      children: [Text(whichCard), Icon(Icons.arrow_drop_down)],
                    ),
                    onPressed: () {
                      setState(() {});
                    },
                  ),
                  ActionChip(
                    label: Row(
                      children: [
                        Text(whichSchool),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ),
                    onPressed: () {
                      setState(() {});
                    },
                  ),
                  ActionChip(
                    label: Row(
                      children: [Text(whichGate), Icon(Icons.arrow_drop_down)],
                    ),
                    onPressed: () {
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
