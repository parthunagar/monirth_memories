import 'package:asset_cache/asset_cache.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/app_string.dart';
import 'dart:ui' as ui;

class BuildGradViewComponent extends StatelessWidget {
  // final stringAssetsWithoutBasePath = TextAssetCache();
  final imageAssets =
      ImageAssetCache(basePath: 'assets/images/pre_wedding_album_pic/album/');

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 3,
      children: List.generate(102, (index) {
        return Container(
          width: width * 0.4,
          height: height * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            image: DecorationImage(
              // image: AssetImage('assets/images/pre_wedding_album_pic/album/album${index + 1}.jpg'),
              // image: NetworkImage('https://bitbucket.org/aff-trackingsystems/clu-mobile-app/src/1a77de05f958899540359aed3d76b36961437fc7/assets/images/cameraImage.png?at=feature%2Fparth%2Ffix_and_improvements'),
              image: NetworkImage(
                 index %2 ==0 ? 'https://sharedby.blomp.com/zxqxOw' :
                'https://sharedby.blomp.com/DooaSa'),
              fit: BoxFit.cover,
            ),
          ),

          ///
          ///
          ///
          ///
          // child: FutureBuilder<ui.Image>(
          //   future: imageAssets.load('album${index + 1}.jpg'),
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       return CustomPaint(
          //         painter: MyImagePainter(snapshot.data!),
          //       );
          //     } else {
          //       return const Text('loading..');
          //     }
          //   },
          // ),
          ///
          ///
          ///
          ///
          // child: CachedNetworkImage(
          //   imageUrl: 'assets/images/pre_wedding_album_pic/album/album${index + 1}.jpg',
          //   placeholder: (context, url) => Icon(Icons.person),
          //   // imageBuilder: (context, imageProvider) => Container(
          //   //   decoration: BoxDecoration(
          //   //     image: DecorationImage(
          //   //       image: imageProvider,
          //   //       fit: BoxFit.cover,
          //   //       colorFilter: ColorFilter.mode(
          //   //         Colors.red,
          //   //         BlendMode.colorBurn,
          //   //       ),
          //   //     ),
          //   //   ),
          //   // ),
          //   // progressIndicatorBuilder: (context, url, progress) {
          //   //   return AngloProgressbar();
          //   // },
          //   errorWidget: (context, url, error) => Icon(Icons.info),
          // ),
        );
      }),
    );
  }
}

class MyImagePainter extends CustomPainter {
  final ui.Image image;

  MyImagePainter(this.image);

  @override
  void paint(Canvas canvas, Size size) {
    final myPaint = Paint();

    canvas.save();
    canvas.translate(100, 100);
    canvas.rotate(1.5);
    canvas.scale(3.0);
    canvas.drawImage(image, Offset.zero, myPaint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
