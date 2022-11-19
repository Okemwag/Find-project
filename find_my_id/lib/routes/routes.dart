import 'package:find_my_id/major_tabs/home_notifications_profile.dart';
import 'package:find_my_id/major_tabs/cam_scan_page.dart';
import 'package:find_my_id/major_tabs/pic_preview_page.dart';
import 'package:find_my_id/major_tabs/search_page.dart';
import 'package:find_my_id/major_tabs/splash.dart';
import 'package:find_my_id/minor_tabs/confirm_popup.dart';
import 'package:find_my_id/minor_tabs/pick_one_popup.dart';
import 'package:find_my_id/routes/hero_page_router.dart';
import 'package:flutter/material.dart';

class RouteManager {
  static const String splash = "/";
  static const String home = "/home";
  static const String snap = "/snap";
  static const String logIn = "/login";
  static const String signUp = "/signup";
  static const String confirmPopup = '/confirmPopup';
  static const String pickOnePopup = '/pickOnePopup';
  static const String camScanPage = '/camScan';
  static const String searchPage = '/searchPage';
  static const String picPreviewPage = '/picPreviewPage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (context) => Splash());
      case home:
        return MaterialPageRoute(
            builder: (context) => HomeNotificationsProfile());
      case camScanPage:
        return MaterialPageRoute(builder: (context) => CamScanPage());
      case searchPage:
        return MaterialPageRoute(builder: (context) => SearchPage());
      case picPreviewPage:
        return MaterialPageRoute(builder: (context) => PicPreviewPage());
      case pickOnePopup:
        return HeroDialogRoute(
            builder: (context) => PickOnePopUp(
                  popupString: args as String,
                ));
      case confirmPopup:
        return HeroDialogRoute(
            builder: (context) => ConfirmPopUp(
                  popupString: args as String,
                ));

      default:
        throw FormatException("Route does not exist");
    }
  }
}
