import 'dart:convert';
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:photospot/controller/gallery_controller.dart';
import 'package:photospot/model/gallery.dart';
import 'package:photospot/model/galleryViewModel.dart';
import 'package:photospot/view/web_image.dart';
import 'package:url_launcher/url_launcher.dart';

class GalleryView extends StatefulWidget {
  const GalleryView({required this.refName, super.key});

  // static const routeName = '/gallery/:refName';

  final String refName;

  @override
  State<StatefulWidget> createState() {
    return GalleryViewState();
  }
}

class GalleryViewState extends State<GalleryView> {
  late GalleryViewModel model;
  late GalleryController con;

  @override
  void initState() {
    super.initState();
    model = GalleryViewModel();
    con = GalleryController(this);
    con.getGallerByRefName(refName: widget.refName);
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

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: model.crossAxisCount,
        childAspectRatio: 4 / 3,
        mainAxisSpacing: model.screenWidth > 1200 ? 20 : 10,
        crossAxisSpacing: model.screenWidth > 1200 ? 20 : 10,
      ),
      itemCount: model.gallery.imageUrls.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(0),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              WebImage(
                url: model.gallery.imageUrls[index],
              ),
              Positioned(
                bottom: 5,
                right: 5,
                child: IconButton(
                  icon: Icon(Icons.download),
                  onPressed: () {
                    downloadFileFromDownloadableLink(
                        model.gallery.imageUrls[index],
                        model.gallery.imageUrls[index]
                            .split('/')
                            .last
                            .split('?')
                            .first);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

void downloadFileFromDownloadableLink(String url, String fileName) {
  html.AnchorElement anchorElement = html.AnchorElement(href: url);
  anchorElement.download = fileName;
  anchorElement.click();
}
