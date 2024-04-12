import 'package:flutter/material.dart';
import '../../core/utils/app_size.dart';
import '../../core/utils/app_string.dart';
import '../widgets/gallery/build_gradiView.dart';
import '../../core/style/app_color.dart';
import '../../core/utils/screen_config.dart';
import '../widgets/gallery/show_alert_dialog.dart';
import '../widgets/gallery/general_button.dart';

class GalleryScreen extends StatelessWidget {
  // const GalleryScreen({});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight,
              color: Colors.black,
              // child:  Image(
              //   fit: BoxFit.cover,
              //   image: AssetImage(AppString.loginBackgroundImage),
              // ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Welcome \n Mr. Parth',
                        style: TextStyle(
                          fontSize: 30,
                          height: 0.9,
                          fontWeight: FontWeight.w500,
                          color: AppColor.gray02,
                        ),
                      ),
                      const Spacer(),
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(AppString.image),
                      ),
                    ],
                  ),
                  AppSize.sv_60,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GeneralButtonComponent(
                        text: 'log out',
                        // color: Colors.red,
                        onPressed: () {},
                        image: Icons.arrow_circle_left, //  AppString.arrowLeft,
                      ),
                      AppSize.sh_20,
                      const GalleryUploadImage(),
                    ],
                  ),
                  AppSize.sv_20,
                  Expanded(
                    child: BuildGradViewComponent(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GalleryUploadImage extends StatelessWidget {
  const GalleryUploadImage({Key? key}) : super(key: key);

  // const GalleryUploadImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralButtonComponent(
      text: 'upload',
      // color: AppColor.gray03,
      image: Icons.arrow_upward, // AppString.arrowUp,
      onPressed: () {
        showDialog(
            context: context,
            barrierColor: Colors.transparent,
            builder: (BuildContext context) => ShowAlertDialog());
      },
    );
  }
}
