import 'package:flutter/material.dart';

class PicPreviewPage extends StatefulWidget {
  const PicPreviewPage({Key? key}) : super(key: key);

  @override
  State<PicPreviewPage> createState() => _PicPreviewPageState();
}

class _PicPreviewPageState extends State<PicPreviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Prev",
        ),
      ),
    );
  }
}
