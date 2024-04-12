library splash_screen_view;

import 'dart:async';


import 'package:auto_route/auto_route.dart';
import 'package:monirth_memories/utils/colors_utils.dart';
import 'package:flutter/services.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:rxdart/rxdart.dart';
// import 'package:auto_finance/core/route/app_route.gr.dart';
// import 'package:auto_finance/provider/dashboard_provider.dart';
// import 'package:auto_finance/ui/views/dash_board/dash_board_view.dart';
// import 'package:auto_finance/ui/views/login/login_view.dart';
// import 'package:auto_finance/utils/custom_colors.dart';
// import 'package:auto_finance/utils/custom_images.dart';
// import 'package:auto_finance/utils/globals.dart';
// import 'package:auto_finance/utils/router_aware_analytics.dart';
import 'splash_view_model.dart';
part 'splash_mobile.dart';
part 'splash_tablet.dart';
part 'splash_desktop.dart';

class SplashScreenView extends StatelessWidget {
  static const routeName = '/splash_screen';
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashScreenViewModel>.reactive(
      viewModelBuilder: () => SplashScreenViewModel(),
      onViewModelReady: (model) {
        // Do something once your model is initialized
        model.init(context);
      },
      builder: (context, model, child) {
        return ScreenTypeLayout.builder(
          mobile: (context) => _SplashScreenMobile(model),
          desktop: (context) => _SplashScreenDesktop(model),
          tablet: (context) => _SplashScreenTablet(model),
        );
      },
    );
  }
}
