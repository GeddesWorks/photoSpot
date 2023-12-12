import 'package:flutter/material.dart';
import 'package:photospot/controller/firestore_controller.dart';
import 'package:photospot/model/gallery.dart';
import 'package:photospot/model/home.dart';
import 'package:photospot/view/headers.dart';
import 'package:photospot/view/imageBox.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/';

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  final logoCutout =
      Image.asset('images/GeddesWorksCutout.png', width: 50, height: 50);
  final logoFull = Image.asset('images/GeddesWorks.png');
  late HomeModel model;
  late FirestoreController con;

  @override
  void initState() {
    super.initState();
    model = HomeModel();
    con = FirestoreController(this);
    con.getGalleryList();
  }

  void callSetState(fn) => setState(fn);

  @override
  Widget build(BuildContext context) {
    model.screenWidth = MediaQuery.of(context).size.width;
    model.crossAxisCount = model.screenWidth > 1200
        ? 4
        : model.screenWidth > 600
            ? 3
            : model.screenWidth > 400
                ? 2
                : 1;
    List<GalleryModel> galleries = model.galleryModels
        .where((element) => element.private == false)
        .toList();

    return Scaffold(
      appBar: appBar(this),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Wrap(
            //   children: welcomeImageAssets
            //       .map(
            //         (item) => Container(
            //           width: 0,
            //           height: 0,
            //           color: Colors.white,
            //           child: item,
            //         ),
            //       )
            //       .toList(),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(12.0),
            //   child: model.screenWidth > 1200
            //       ? Row(
            //           children: [
            //             welcomeImages(context, model.screenWidth / 2),
            //             topInfo(context, model.screenWidth / 2),
            //           ],
            //         )
            //       : Column(
            //           children: [
            //             welcomeImages(context, model.screenWidth),
            //             topInfo(context, model.screenWidth),
            //           ],
            //         ),
            // ),
            // model.inProgress
            //     ? const Center(
            //         child: CircularProgressIndicator(),
            //       )
            Padding(
              padding: EdgeInsets.all(model.screenWidth > 1200 ? 16.0 : 8.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: model.crossAxisCount,
                  childAspectRatio: 4 / 3,
                  mainAxisSpacing: model.screenWidth > 1200 ? 20 : 10,
                  crossAxisSpacing: model.screenWidth > 1200 ? 20 : 10,
                ),
                itemCount: galleries.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: imageBox(galleries![index], context, this),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: model.screenWidth <= 600
          ? ElevatedButton(
              onPressed: () => {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
              child: Text('Contact Us'),
            )
          : null,
      bottomNavigationBar: SizedBox(
        height: model.screenWidth > 1200
            ? 100
            : model.screenWidth > 600
                ? 75
                : 50,
        child: Footer(),
      ),
    );
  }

  Widget topInfo(context, screenWidth) {
    Image accentBanner = Image.asset(
      'images/accentBanner1.png',
      width: screenWidth * .9,
    );
    double padding = screenWidth * .01;

    double textSize = screenWidth * .03;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: screenWidth,
        height: ((screenWidth * .9) / 5) * 2.9,
        child: Container(
          color: Color(0xFF7d7d7c),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Padding(
              //   padding: EdgeInsets.all(padding),
              //   child: Text(welcomeMessage,
              //       style: TextStyle(
              //         fontSize: textSize,
              //       )),
              // ),
              // // SizedBox(height: 8.0),
              // Padding(
              //   padding: EdgeInsets.all(padding),
              //   child: Text(
              //     printShopAbout,
              //     style: TextStyle(
              //       fontSize: textSize,
              //     ),
              //   ),
              // ),
              // // SizedBox(height: 8.0),
              // Padding(
              //   padding: EdgeInsets.all(padding),
              //   child: Text(
              //     printShopInstructions,
              //     style: TextStyle(
              //       fontSize: textSize,
              //     ),
              //   ),
              // ),
              // // SizedBox(height: 8.0),
              // Padding(
              //   padding: EdgeInsets.all(padding),
              //   child: Text(
              //     printShopPaymentInstructions,
              //     style: TextStyle(
              //       fontSize: textSize,
              //     ),
              //   ),
              // ),
              Spacer(),
              accentBanner,
            ],
          ),
        ),
      ),
    );
  }

  // Widget welcomeImages(context, screenWidth) {
  //   return Center(
  //     child: Padding(
  //       padding: const EdgeInsets.all(16.0),
  //       child: SizedBox(
  //         width: screenWidth * .9,
  //         height: ((screenWidth * .9) / 5) * 4,
  //         child: Swiper(
  //           viewportFraction: .8,
  //           scale: .9,
  //           autoplay: true,
  //           autoplayDelay: 5000,
  //           itemCount: welcomeImageAssets.length,
  //           itemBuilder: (context, index) {
  //             return Padding(
  //               padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
  //               child: welcomeImageAssets[index],
  //             );
  //           },
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
