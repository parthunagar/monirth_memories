import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/utils/app_string.dart';
import '../../../core/utils/screen_config.dart';
import 'alery_elevated_button.dart';

class ShowAlertDialog extends StatelessWidget {
  // const ShowAlertDialog({super.key});
  File? profileImage;
  final ImagePicker _picker = ImagePicker();
  
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return AlertDialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          width: SizeConfig.screenWidth * 0.1,
          height: SizeConfig.screenHeight * 0.3,
          child: Stack(
            alignment: Alignment.center,
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  color: Colors.white.withOpacity(0.4),
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenWidth,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AlertElevatedButton(
                    text: 'Gallery',
                    imagePath: Icons.photo,
                    iconSize: 60.0,
                    onPressed: () {
                      _uploadImage(ImageSource.gallery);
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 10.0),
                  AlertElevatedButton(
                    text: 'Camera',
                    imagePath: Icons.camera,// AppString.selectCamera,
                    iconSize: 60.0,
                    onPressed: () {
                      _uploadImage(ImageSource.camera);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  FutureOr<void> _uploadImage(source) async {
    // to get image for user
    final pickedFile = await _picker.pickImage(source: source);
    if (PickedFile != null) {
      profileImage = File(pickedFile!.path);

      print('the image is 🚀${profileImage!.path}');
    } else {
      print('No image selected');
    }
  }
}
