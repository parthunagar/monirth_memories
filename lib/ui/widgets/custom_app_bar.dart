import 'package:monirth_memories/utils/colors_utils.dart';
import 'package:monirth_memories/utils/style.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double _preferredHeight = 56;
  final void Function() onTap;
  List<Widget>? actions;
  final String title;
  String? buttonTitle;
  PreferredSizeWidget? bottom;
  bool? showLeading;
  CustomAppBar({
    Key? key,
    this.buttonTitle,
    required this.title,
    required this.onTap,
    this.actions,
    this.bottom,
    this.showLeading = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      elevation: 0,
      centerTitle: true,
      // automaticallyImplyLeading: true,
      leadingWidth: 80,
      // leading: Conditional.ifelse(
      //   showLeading == false,
      //   valid: SizedBox(),
      //   invalid: Padding(
      //     padding: EdgeInsets.only(left: 16),
      //     child: InkWell(
      //       onTap: onTap,
      //       child: Row(
      //         children: [
      //           SvgPicture.asset(AngloIcon.backIcon),
      //           const SizedBox(width: 5),
      //           Text('Back'),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      bottom: bottom,
      title: Text(
        title,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: AppColors.secondary,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
      ),
      actions: actions ?? [],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_preferredHeight);
}

// ignore: must_be_immutable
class CustomAppBarLight extends StatelessWidget implements PreferredSizeWidget {
  final double _preferredHeight = 56;
  final void Function() onTap;
  List<Widget>? actions;
  final String title;
  String? buttonTitle;
  PreferredSizeWidget? bottom;
  bool? showLeading;
  CustomAppBarLight({
    Key? key,
    this.buttonTitle,
    required this.title,
    required this.onTap,
    this.actions,
    this.bottom,
    this.showLeading = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.secondary,
      elevation: 0,
      centerTitle: true,
      leadingWidth: 65,
      // leading: Padding(
      //   padding: EdgeInsets.only(left: 0),
      //   child: IconButton(
      //     onPressed: onTap,
      //     icon: Padding(
      //       padding: const EdgeInsets.symmetric(vertical: 5),
      //       child: SvgPicture.asset(
      //         AngloIcon.arrowLeft,
      //         // color: AngloColors.secondary,
      //       ),
      //     ),
      //   ),
      // ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 22),
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: AppColors.blackShade,
                  fontSize: 36,
                  fontFamily: AppStyle.bold,
                ),
          ),
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(_preferredHeight + (kToolbarHeight - 20));
}
