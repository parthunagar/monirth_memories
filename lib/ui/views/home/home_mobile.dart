part of home_view;

class _HomeMobile extends StatelessWidget {
  final HomeViewModel viewModel;
  const _HomeMobile(this.viewModel);

  
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(
        onTap: () {},
        title: 'Home',
      ),

      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ElevatedButton(
          //     onPressed: () {
          //       Navigator.push(context,
          //           MaterialPageRoute(builder: (context) => SignInDemo()));
          //     },
          //     child: Text('GOOGLE SIGN IN')),
          // ElevatedButton(
          //     onPressed: () {
          //       viewModel.signInWithGoogle();
          //     },
          //     child: Text('GOOGLE')),
          // ElevatedButton(
          //     onPressed: () async {
          //       final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
          //       await _firebaseAuth.signOut();
          //       //  Navigator.pop(context);
          //     },
          //     child: Text('LOGOUT')),
          // ElevatedButton(
          //     onPressed: () async {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //               builder: (context) => StorageExampleApp()));
          //       // viewModel.getDukhnaPhotoList();
          //     },
          //     child: Text('GET DATA')),
          // FutureBuilder(
          //   future: viewModel.getImg(),
          //   builder: (context, AsyncSnapshot<String> snapshot) {
          //     if (snapshot.hasData) {
          //       return Text('${snapshot.data}');
          //     } else {
          //       return Text('ERROR : ${snapshot.data}');
          //     }
          //   },
          // ),
          //https://github.com/parthunagar/monirth_memories/blob/main/assets/images/pre_wedding_album_pic/album/album1.jpg
          Expanded(
            child: GridView.count(
                // primary: false,
                shrinkWrap: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                children: List.generate(48, (i) {
                  // Future<String> link = snapshot.data![i].getDownloadURL();
                  // var link = snapshot.data![i];
                  // print('====> link : $link');
                  var albumLink = 'https://github.com/parthunagar/monirth_memories/blob/main/assets/images/pre_wedding_album_pic/album/album';
                  return Container(
                    width: w * 0.4,
                    height: h * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      // color: Colors.red,
                      image: DecorationImage(
                        // image: AssetImage('assets/images/pre_wedding_album_pic/album/album${index + 1}.jpg'),
                        // image: NetworkImage('https://bitbucket.org/aff-trackingsystems/clu-mobile-app/src/1a77de05f958899540359aed3d76b36961437fc7/assets/images/cameraImage.png?at=feature%2Fparth%2Ffix_and_improvements'),
                        // image: NetworkImage(snapshot.data![i].getDownloadURL().toString()),
                        image: NetworkImage(
                          // 'https://github.com/parthunagar/monirth_memories/blob/main/assets/images/pre_wedding_album_pic/album/album${i + 1}.jpg',
                          i + 1 == 19
                              ? '$albumLink${i + 1}.JPG?raw=true'
                              : '$albumLink${i + 1}.jpg?raw=true',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                })),
          ),
          /*
          FutureBuilder<ListResult>(
              // future: viewModel.getDukhnaPhotoList(),
              future: viewModel.futureFiles,
              builder: (context, snapshot) {
                // builder: (context, AsyncSnapshot<List<String>> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  print('====> snapshot : $snapshot');
                  return Container(
                    padding: const EdgeInsets.all(10.0),
                    /*
                    child: GridView.count(
                      primary: false,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 3,
                      children: List.generate(snapshot.data!.length, (i) {
                        // Future<String> link = snapshot.data![i].getDownloadURL();
                        // var link = snapshot.data![i];
                        // print('====> link : $link');
                        return Container(
                          width: w * 0.4,
                          height: h * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            image: DecorationImage(
                              // image: AssetImage('assets/images/pre_wedding_album_pic/album/album${index + 1}.jpg'),
                              // image: NetworkImage('https://bitbucket.org/aff-trackingsystems/clu-mobile-app/src/1a77de05f958899540359aed3d76b36961437fc7/assets/images/cameraImage.png?at=feature%2Fparth%2Ffix_and_improvements'),
                              // image: NetworkImage(snapshot.data![i].getDownloadURL().toString()),
                              image: NetworkImage(snapshot.data![i].toString()),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                    //     // child: Text('${snapshot.data![i]}'),

                    //     return CachedNetworkImage(
                    //       imageUrl: link.toString(),
                    //       placeholder: (context, url) => Icon(Icons.person),
                    //       imageBuilder: (context, imageProvider) => Container(
                    //         decoration: BoxDecoration(
                    //           image: DecorationImage(
                    //             image: imageProvider,
                    //             fit: BoxFit.cover,
                    //             colorFilter: const ColorFilter.mode(
                    //               Colors.red,
                    //               BlendMode.colorBurn,
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //       progressIndicatorBuilder: (context, url, progress) {
                    //         return CircularProgressIndicator();
                    //       },
                    //       errorWidget: (context, url, error) => Icon(Icons.info),
                    //     );
                      }),
                    ), */
                  );
                } else if (snapshot.connectionState == ConnectionState.none) {
                  return const Text(
                    "No data",
                    style: TextStyle(color: Colors.black),
                  );
                }

                return const CircularProgressIndicator();
              }),
               */
        ],
      ),
      // body: Center(
      //   child: Column(
      //     children: [
      //       ElevatedButton(
      //         onPressed: () {
      //           Navigator.push(context, MaterialPageRoute(builder: (context)=> GalleryScreen()));
      //         },
      //         child: Text('Gallary APP demo'),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
