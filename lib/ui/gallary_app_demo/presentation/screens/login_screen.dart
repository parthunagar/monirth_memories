import 'package:monirth_memories/ui/gallary_app_demo/presentation/screens/gallery_screen.dart';
import 'package:flutter/material.dart';
import '../../core/style/app_color.dart';
import '../../core/utils/app_string.dart';
import '../../core/utils/app_size.dart';
import '../../core/utils/screen_config.dart';
import '../widgets/login/text_form_filed_component.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight,
              color: AppColor.gray01,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(AppString.loginBackgroundImage),
              ),
            ),
            Positioned(
              top: -30,
              left: -40,
              child: SizedBox(
                width: SizeConfig.screenHeight * 0.4,
                height: SizeConfig.screenHeight * 0.3,
                child: Icon(Icons.camera),
                // child: Image(
                //   image: AssetImage(AppString.loginCamera),
                // ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              left: 10,
              bottom: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'My \nGallery',
                    style: TextStyle(
                      fontSize: 40,
                      height: 0.9,
                      fontWeight: FontWeight.bold,
                      color: AppColor.gray02,
                    ),
                  ),
                  AppSize.sv_10,
                  Container(
                    width: SizeConfig.screenWidth * 0.8,
                    height: SizeConfig.screenHeight * 0.45,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white.withOpacity(0.8),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'LOG IN',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.gray02,
                                ),
                              ),
                              AppSize.sv_10,
                              TextFormComponent(
                                controller: emailController,
                                hintText: 'uer name',
                                keyboardType: TextInputType.emailAddress,
                                obscureText: false,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  return null;
                                },
                              ),
                              AppSize.sv_20,
                              TextFormComponent(
                                controller: passwordController,
                                hintText: 'password',
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                },
                              ),
                              AppSize.sv_10,
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> GalleryScreen()));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColor.blue,
                                    elevation: 0.0,
                                    maximumSize:
                                        Size(SizeConfig.screenWidth * 0.8, 45),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Center(
                                    child:
                                        false
                                            ? const CircularProgressIndicator(
                                                color: Colors.amber,
                                              )
                                            : Text(
                                                ' SUBMIT',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppColor.white,
                                                ),
                                              ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
