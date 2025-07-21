import 'package:flutter/material.dart';

class ResponsiveService {
  ResponsiveService(this.context);

  final BuildContext context;

  double get widthScreen => MediaQuery.sizeOf(context).width;

  bool get isPhone {
    return widthScreen <= 767;
  }

  bool get isTablet {
    return widthScreen > 767 && widthScreen <= 1180;
  }

  bool get isDesktop {
    return widthScreen > 1180;
  }

  T buildAny<T>(T phone, T tablet, T desktop) {
    if (isPhone) {
      return phone;
    }
    if (isTablet) {
      return tablet;
    }
    return desktop;
  }
}
