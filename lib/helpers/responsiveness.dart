// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

const int largeScreenSize = 1366;
const int mediumScreenSize = 768;
const int smallScreenSize = 360;

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;

  const ResponsiveWidget({
    Key? key,
    required this.largeScreen,
    this.mediumScreen,
    this.smallScreen,
  }) : super(key: key);

  static bool isSmall(BuildContext context) =>
      MediaQuery.of(context).size.width < smallScreenSize;

  static bool isMedium(BuildContext context) =>
      MediaQuery.of(context).size.width >= mediumScreenSize &&
      MediaQuery.of(context).size.width < largeScreenSize;

  static bool isLarge(BuildContext context) =>
      MediaQuery.of(context).size.width >= largeScreenSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (isLarge(context))
        return largeScreen;
      else if (isMedium(context))
        return mediumScreen ?? largeScreen;
      else
        return smallScreen ?? largeScreen;
    });
  }
}
