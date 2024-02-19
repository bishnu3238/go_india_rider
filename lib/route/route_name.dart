import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum RouteName {
  intro,
  home,
  indexHome,
  settings,

  notification,
  login,
  signup,
  otp,
  forgetPassword,
  newPassword,
  reviewScreen,

  paymentSuccess, onboarding, placeSearch, selectOnMap
}

extension AppPageExtension on RouteName {
  String get path => '/$name'; // e.g : "/splash", "/userProfile"

  String get subPath => name; // e.g : "splash", "userProfile"

  String get cName => name.toUpperCase(); // e.g : "SPLASH" "USERPROFILE"

  String get branchKey => "Screen$name";

  GlobalKey<NavigatorState> get globalNavKey => GlobalKey<NavigatorState>();

  String get subCName {
    String enumString = toString().split('.').last;
    List<String> words = enumString.split(RegExp('(?=[A-Z])'));
    String result = words
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join('-');
    return result;
  } // e.g: "Slash", "User-Profile"

  String get capitalName {
    String enumString = toString().split('.').last;
    List<String> words = enumString.split(RegExp('(?=[A-Z])'));
    String result =
        words.map((word) => word[0].toUpperCase() + word.substring(1)).join('');
    return result;
  } // e.g: "Slash", "User Profile"

  String nameRoute(BuildContext context, Map<String, String>? pathParams,
          Map<String, String>? queryParams) =>
      GoRouter.of(context).namedLocation(
        cName,
        pathParameters: pathParams ?? {},
        queryParameters: queryParams ?? {},
      );

  void go(
    BuildContext context, {
    Map<String, String>? pathParams,
    Map<String, String>? queryParams,
    Object? extra,
  }) =>
      context.go(
        nameRoute(context, pathParams, queryParams),
        extra: extra,
      );
}
