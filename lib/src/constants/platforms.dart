import 'package:flutter/foundation.dart';

/// check if the current platform is Windows
final bool isDroidconWindows =
    (defaultTargetPlatform == TargetPlatform.windows);

/// check if the current platform is Windows
final bool isDroidconAndroid =
    (defaultTargetPlatform == TargetPlatform.android);

/// check if the current platform is Windows
final bool isDroidconiOs = (defaultTargetPlatform == TargetPlatform.iOS);

/// check if the current platform is Windows or Web
const bool isDroidconWeb = (kIsWeb);

/// check if the current platform is Windows or Web
final bool isDroidconWebOrWindows = (isDroidconWindows || isDroidconWeb);

///This variable declares that if we are on phone
///, no mouse region, else we gat a mouse region
final isPhone = (isDroidconAndroid || isDroidconiOs);
