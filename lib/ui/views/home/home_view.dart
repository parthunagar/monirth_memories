library home_view;

import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:monirth_memories/model/firebase_api_model.dart';
import 'package:monirth_memories/ui/gallary_app_demo/presentation/screens/gallery_screen.dart';
import 'package:monirth_memories/ui/views/home/goolge_signin.dart';
import 'package:monirth_memories/ui/views/home/storage_demo.dart';
import 'package:monirth_memories/ui/widgets/custom_app_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'home_view_model.dart';

part 'home_mobile.dart';
part 'home_tablet.dart';
part 'home_desktop.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onViewModelReady: (model) {
        // Do something once your model is initialized
      },
      builder: (context, model, child) {
        return ScreenTypeLayout.builder(
          mobile: (context) => _HomeMobile(model),
          desktop: (context) => _HomeDesktop(model),
          tablet: (context) => _HomeTablet(model),
        );
      },
    );
  }
}
