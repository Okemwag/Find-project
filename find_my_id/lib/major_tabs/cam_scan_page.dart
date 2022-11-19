import 'dart:io';

import 'package:camera/camera.dart';
import 'package:find_my_id/chopper_api/my_api_services.dart';
import 'package:find_my_id/constants/string_resources.dart';
import 'package:find_my_id/decor/palette.dart';
import 'package:find_my_id/decor/text_styles.dart';
import 'package:find_my_id/main.dart';
import 'package:find_my_id/notifiers/photo_notifier.dart';
import 'package:http/http.dart' as http;
import 'package:find_my_id/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class CamScanPage extends StatefulWidget {
  const CamScanPage({Key? key}) : super(key: key);
  @override
  State<CamScanPage> createState() => _CamScanPageState();
}

class _CamScanPageState extends State<CamScanPage> {
  late CameraController controller;
  bool isFlashOn = false;
  XFile? imageFile;

  @override
  void initState() {
    super.initState();

    //request storage permission
    _requestPermissions();

    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print('User denied camera access.');
            break;
          default:
            print('Handle other errors.');
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: CameraPreview(
              controller,
              child: _positionedWindow(),
            ),
          ),
          Positioned.fromRelativeRect(
            rect: RelativeRect.fromLTRB(0, 0, 0, 25),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _createIconButton(Icon(Icons.photo), _onGalleryButtonPressed),
                  _createIconButton(Icon(Icons.camera), _onCaptureButtonPressed,
                      iconSize: 50),
                  _createIconButton(
                      Icon(Icons.text_fields), _onTextButtonPressed),
                ],
              ),
            ),
          ),
          Positioned.fromRelativeRect(
            rect: RelativeRect.fromLTRB(0, 40, 0, 0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _createIconButton(
                        Icon(Icons.close), () => Navigator.pop(context),
                        iconSize: 20),
                    Text(
                      fitWindowMessage,
                      style: appBarText.copyWith(
                          color: colorCameraPageForeground,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                    isFlashOn
                        ? _createIconButton(Icon(Icons.flash_off), () {
                            _onSetFlashModeButtonPressed(FlashMode.off);
                          }, iconSize: 20)
                        : _createIconButton(Icon(Icons.flash_on), () {
                            _onSetFlashModeButtonPressed(FlashMode.torch);
                          }, iconSize: 20)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createIconButton(Icon icon, void Function() onPressed,
      {double iconSize = 35.0}) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
      iconSize: iconSize,
      color: colorCameraPageForeground,
    );
  }

  Future<XFile?> cameraCapture() async {
    XFile? image;
    try {
      image = await controller.takePicture();
    } on CameraException catch (e) {
      createSnackBar(context: context, text: '${e.toString()}');
    }
    return image;
  }

  Future<XFile?> pickImageFromGallery() async {
    XFile? image;
    try {
      image = await ImagePicker().pickImage(source: ImageSource.gallery);
    } on PlatformException catch (e) {}
    return image;
  }

  void _onCaptureButtonPressed() {
    cameraCapture().then((xFile) {
      if (xFile != null) {
        File file = File(xFile.path);
        Provider.of<PhotosNotifier>(context, listen: false).selectImage(file);
        print(xFile.path.toString());
      }
    });
    sendCardToDB();
  }

  void _onGalleryButtonPressed() {
    pickImageFromGallery().then((xFile) {
      if (xFile != null) {
        File file = File(xFile.path);
        Provider.of<PhotosNotifier>(context, listen: false).selectImage(file);
        print(xFile.path.toString());
      }
    });
    sendCardToDB();
  }

  void _requestPermissions() async {
    //Add more permissions that may be required here
    await [
      Permission.storage,
    ].request();
  }

  void _onSetFlashModeButtonPressed(FlashMode mode) {
    setFlashMode(mode).then((_) {
      if (mounted) {
        setState(() {
          isFlashOn = !isFlashOn;
        });
      }
    });
  }

  Future<void> setFlashMode(FlashMode mode) async {
    try {
      await controller.setFlashMode(mode);
    } on CameraException catch (e) {
      rethrow;
    }
  }

  Widget _positionedWindow() {
    return Positioned.fromRelativeRect(
      rect: RelativeRect.fromLTRB(12, 220, 12, 220),
      child: Container(
        decoration: BoxDecoration(
            color: idWindowColor,
            borderRadius: BorderRadius.circular(7),
            border: Border.all(width: 3, color: colorCameraWindowBorder)),
      ),
    );
  }

  void _onTextButtonPressed() {
    //TODO: open Text Input Page
  }
  void sendCardToDB() {
    recognizeCharacters();
  }

  Future recognizeCharacters() async {
    File? selectedPhoto = context.read<PhotosNotifier>().selectedPhoto;
    http.MultipartFile? image;

    if (selectedPhoto != null) {
      image = await http.MultipartFile.fromPath(
        'image',
        selectedPhoto.path,
      );
    }

    //Recognize characters here

    var response =
        await Provider.of<MyApiService>(context, listen: false).postCard(
      image: image,
      firstName: "George",
      secondName: "Bange",
      thirdName: "Ogeto",
      regNumber: "ENE221-0109/2017",
      department: "TIE",
      schoolName: "SEEIE",
      locationFound: "GATE A",
    );
    bool isSuccessful = response.isSuccessful;
    // Navigator.popUntil(context, ModalRoute.withName(RouteManager.home));
    if (isSuccessful) {
      createSnackBar(context: context, text: 'Successfully uploaded ID card');
      Navigator.pop(context);
    } else {
      createSnackBar(context: context, text: 'Unsuccessful');
      Navigator.pop(context);
    }
  }
}
